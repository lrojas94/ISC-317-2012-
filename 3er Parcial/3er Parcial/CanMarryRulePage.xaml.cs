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
            {
                MessageBox.Show("Su personaje no ha sido encontrado.");
                return;
            }

            List<Character> candidates = Instance.CandidatesToMarry(_result.Name);
            personajesList.ItemsSource = candidates;
            if (candidates.Count > 0)
                personajesList.SelectedIndex = 0;
            else {
                MessageBox.Show("Lo Sentimos, Su personaje no puede casarse...");
            }
        }
    }
}
