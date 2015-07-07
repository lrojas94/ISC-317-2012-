using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Prolog;
using Prolog.Code;
namespace _3er_Parcial
{
    class PrologResult {
        private ExecutionResults status;
        public ExecutionResults Status {
            get {
                return status;
            }
        }
        private List<Dictionary<string, string>> vars = new List<Dictionary<string, string>>();
        public List<Dictionary<string, string>> Vars {
            get {
                return vars;
            }
            set {
                vars = value;
            }
        }

        public PrologResult(ExecutionResults initialStatus) {
            status = initialStatus;
        }

        public List<string> VariableWithName(string name) {
            List<string> returnValue = new List<string>();
            foreach (Dictionary<string,string> result in vars)
            {
                returnValue.Add(result[name]);
            }
            return returnValue;
        }
    }

    class PrologHandler
    {
        private static PrologHandler instance;
        private Prolog.Program program;

        private PrologHandler() {
            program = new Prolog.Program();
        }

        public static PrologHandler Instance {
            get {
                if (instance == null)
                    instance = new PrologHandler();
                return instance;
            }
        }

        /*public void LoadFile(string filePath) {
            string text = System.IO.File.ReadAllText(filePath);
            Regex reg = new Regex(@"%.*"); //Remove all comments
            text = reg.Replace(text, "");
            
            CodeSentence[] sentences = Prolog.Parser.Parse(text);
            foreach (CodeSentence sentence in sentences) {
                program.Add(sentence);
            }
            
        }*/

        public PrologResult Query(string query) {
            
            query = ":-" + query; //Use the query form for Prolog.NET
            CodeSentence sentence = Parser.Parse(query)[0];
            Query q = new Prolog.Query(sentence);
            PrologMachine machine = PrologMachine.Create(program, q);

            PrologResult result = new PrologResult(machine.RunToSuccess());//First time run marks TRUE/FALSE result.
            ExecutionResults resultStatus = result.Status;
            
            while ( resultStatus == ExecutionResults.Success)
            {
                PrologVariableList variables = machine.QueryResults.Variables;
                Dictionary<string, string> vars = new Dictionary<string, string>();
                foreach (PrologVariable v in variables)
                {
                    vars.Add(v.Name, v.Text);
                }
                if(vars.Count != 0)
                    result.Vars.Add(vars);
                resultStatus = machine.RunToSuccess();
            }

            return result;
        }

        

    }
}
