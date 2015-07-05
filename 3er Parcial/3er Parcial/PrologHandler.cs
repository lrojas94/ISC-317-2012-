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

        public List<Dictionary<string, string>> Query(string query) {
            List<Dictionary<string, string>> output = new List<Dictionary<string, string>>();

            query = ":-" + query; //Use the query form for Prolog.NET
            CodeSentence sentence = Parser.Parse(query)[0];
            Query q = new Prolog.Query(sentence);
            PrologMachine machine = PrologMachine.Create(program, q);
            ExecutionResults results = machine.RunToSuccess();
            
            while (results == ExecutionResults.Success)
            {
                PrologVariableList variables = machine.QueryResults.Variables;
                Dictionary<string, string> result = new Dictionary<string, string>();
                foreach (PrologVariable v in variables)
                {
                    result.Add(v.Name, v.Text);
                }
                output.Add(result);
                results = machine.RunToSuccess();
            }

            return output;
        }

        

    }
}
