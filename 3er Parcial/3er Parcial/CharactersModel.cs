using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3er_Parcial
{
    class CharactersModel
    {
        private static CharactersModel instance;

        public static CharactersModel Instance {
            get {
                if (instance == null)
                    instance = new CharactersModel();
                return instance;
            }
        }

        private PrologResult characterBasics = null;
        private List<Character> characters = new List<Character>();

        public List<Character> Characters {
            get
            {
                return characters;
            }
        }

        private CharactersModel() {
            //Get all characters.
            characterBasics = PrologHandler.Instance.Query("gender(Name,Gender)");
            createCharacters();
        }

        private void createCharacters() {
            foreach (Dictionary<String, String> character in characterBasics.Vars) {
                string name = character["Name"];
                string gender = character["Gender"];

                Character newCharacter = new Character(name, gender);
                characters.Add(newCharacter);
            }
        }
        public Character FindCharacterWith(string name) {
            name = name.ToLower();
            name = name.Replace(' ', '_');
            foreach (Character c in characters)
                if (c.Name == name)
                    return c;
            return null;
        }

        public List<Character> CandidatesToMarry(string victim)
        {
            List<Character> candidates = new List<Character>();

            // Todos los candidatos al matrimonio de la "victima"
            PrologResult result = PrologHandler.Instance.Query("canMarry(" + victim + ", Candidate).");
            if (result.Status == Prolog.ExecutionResults.Success)
            {
                foreach (Dictionary<string, string> _result in result.Vars)
                {
                    candidates.Add(FindCharacterWith(_result["Candidate"]));
                }
            }

            return candidates;
        }

        public bool AreEnemies(Character charOne, Character charTwo) {
            string query = String.Format("areRivals({0},{1})", charOne.Name, charTwo.Name);
            PrologResult result = PrologHandler.Instance.Query(query);
            if (result.Status == Prolog.ExecutionResults.Success)
                return true;
            return false;
        }
    }
}
