using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace _3er_Parcial
{
    /// <summary>
    /// Interaction logic for CanInheritPage.xaml
    /// </summary>
    public partial class CanInheritPage : Page
    {
        public CanInheritPage()
        {
            InitializeComponent();
            housesCb.ItemsSource = housesCb_FillCombobox();
            //housesCb.SelectedIndex = 0;
        }

        private List<string> housesCb_FillCombobox()
        {

            List<string> houses = new List<string>();
            PrologResult result = PrologHandler.Instance.Query("house(House).");
            foreach (Dictionary<string, string> _result in result.Vars)
            {
                houses.Add(_result["House"]);
            }

            //housesCb.ItemsSource = houses;
            return houses;
        }

        private void housesCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CharactersModel instance = CharactersModel.Instance;
            Console.Out.Write(e.ToString() + "\n");
            Console.Out.Write(sender.ToString() + "\n");
            Character inheritor = instance.InheritorOfHouse(sender.ToString());

            Console.Out.Write(inheritor.Name + "\n");
        }
    }
}
