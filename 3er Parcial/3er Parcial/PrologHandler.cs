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
    struct PrologResult {
        public ExecutionResults Status;
        public List<Dictionary<string, string>> Vars;
    }

    class PrologHandler
    {
        private static PrologHandler instance;
        private static Prolog.Program program;
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

        public void LoadFile(string filePath) {
            string text = System.IO.File.ReadAllText(filePath);
            Regex reg = new Regex(@"%.*"); //Remove all comments
            text = reg.Replace(text, "");
            
            CodeSentence[] sentences = Prolog.Parser.Parse(text);
            foreach (CodeSentence sentence in sentences) {
                program.Add(sentence);
            }
            
        }

        public PrologResult Query(string query) {

            PrologResult result = new PrologResult();
            result.Vars = new List<Dictionary<string, string>>();
            query = ":-" + query; //Use the query form for Prolog.NET
            CodeSentence sentence = Parser.Parse(query)[0];
            Query q = new Prolog.Query(sentence);
            PrologMachine machine = PrologMachine.Create(program, q); 
            result.Status = machine.RunToSuccess(); //First time run marks TRUE/FALSE result.
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
