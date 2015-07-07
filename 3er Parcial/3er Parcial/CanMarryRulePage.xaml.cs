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
    /// Interaction logic for CanMarryRulePage.xaml
    /// </summary>
    public partial class CanMarryRulePage : Page
    {
        public CanMarryRulePage()
        {
            InitializeComponent();
        }

        private void buscarbtn_Click(object sender, RoutedEventArgs e)
        {
            CharactersModel Instance = CharactersModel.Instance;
            Character _result = Instance.FindCharacterWith(personajeTextbox.Text);

            if (_result == null)
                return;

            List<Tuple<string,string>> candidates = Instance.CandidatesToMarry(_result.Name);

            List<string> persons = new List<string>();
            List<string> houses =  new List<string>();

            foreach (Tuple<string, string> pair in candidates)
            {
                persons.Add(pair.Item1);
                houses.Add(pair.Item2);
            }

            personajesList.ItemsSource = persons;
            houseList.ItemsSource = houses;
        }
    }
}
