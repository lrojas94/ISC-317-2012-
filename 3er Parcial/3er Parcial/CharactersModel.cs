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
        private PrologResult characterBasics = null;
        private List<Character> characters = new List<Character>();
        public List<Character> Characters {
            get
            {
                return characters;
            }
        }

        public CharactersModel() {
            //Get all characters.
            characterBasics = PrologHandler.Instance.Query("gender(Name,Gender)");
            createCharacters();
        }

        private void createCharacters() {
            foreach (Dictionary<String, String> character in characterBasics.Vars) {
                string name = character["Name"];
                TextInfo unitedStatesInfo = new CultureInfo("en-US", false).TextInfo;
                name = name.Replace('_', ' ');
                name = unitedStatesInfo.ToTitleCase(name);

                string gender = character["Gender"];
                gender = unitedStatesInfo.ToTitleCase(gender);

                Character newCharacter = new Character(name, gender);
                characters.Add(newCharacter);
            }
        }
    }
}
