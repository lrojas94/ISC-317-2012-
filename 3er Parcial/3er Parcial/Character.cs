using System;
using System.Windows.Media;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3er_Parcial
{
    class Character
    {
        private string name;
        private string gender;

        public string Name {
            get {
                return name;
            }
            set {
                name = value;
            }
        }

        public string Gender {
            get {
                return gender;
            }
            set {
                gender = value;
            }
        }

        public SolidColorBrush GenderColor {
            get {
                switch(gender){
                    case "Man":
                        return (SolidColorBrush)(new BrushConverter().ConvertFrom("#2980b9")); //BELIZE HOLE (Blue)
                    case "Woman":
                        return (SolidColorBrush)(new BrushConverter().ConvertFrom("#8e44ad")); //WISTERIA (Purple)
                    default:
                        return (SolidColorBrush)(new BrushConverter().ConvertFrom("#2c3e50")); //MIDNIGHT BLUE (Black)
                }

            }
        }

        public Character(string name, string gender) {
            this.name = name;
            this.gender = gender;
        }
    }
}
