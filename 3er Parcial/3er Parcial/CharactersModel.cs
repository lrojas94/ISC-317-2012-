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
        private List<string> houses;
        private TextInfo Formatter = new CultureInfo("en-US", false).TextInfo;

        public List<String> Houses {
            get {
                if (houses == null) {
                    houses = new List<string>();

                    PrologResult result = PrologHandler.Instance.Query("house(House)");
                    if (result.Status == Prolog.ExecutionResults.Success) {
                        houses = result.VariableWithName("House");
                    }
                }

                return houses;
            }
        }

        public List<string> FormattedHouses {
            get {
                List<string> actHouses = Houses;
                List<string> formatted = new List<string>();
                foreach (string house in actHouses)
                    formatted.Add(format(house));

                return formatted;
            }


        }
        

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
            name = prologFormat(name);
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

        public Character InheritorOfHouse(string housename)
        {
            housename = prologFormat(housename);
            Character inheritor;
            PrologResult result = PrologHandler.Instance.Query("inheritor(" + housename + ",Inheritor).");
            if (result.Status == Prolog.ExecutionResults.Success)
            {
                inheritor = instance.FindCharacterWith(result.Vars[0]["Inheritor"]);
            }
            else
            {
                inheritor = new Character("none", "none");
            }

            return inheritor;
        }

        public bool AreEnemies(Character charOne, Character charTwo) {
            string query = String.Format("areRivals({0},{1})", charOne.Name, charTwo.Name);
            PrologResult result = PrologHandler.Instance.Query(query);
            if (result.Status == Prolog.ExecutionResults.Success)
                return true;
            return false;
        }

        private string prologFormat(string s) {
            s = s.ToLower();
            s = s.Replace(' ', '_');
            return s;
        }

        private string format(string s) {
            s = s.Replace('_', ' ');
            s = Formatter.ToTitleCase(s);
            return s;
        }

        
    }
}
