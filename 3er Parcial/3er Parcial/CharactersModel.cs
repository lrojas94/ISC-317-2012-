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
    }
}
