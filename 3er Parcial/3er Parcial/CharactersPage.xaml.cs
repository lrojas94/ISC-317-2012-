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
    /// Interaction logic for CharactersPage.xaml
    /// </summary>
    public partial class CharactersPage : Page
    {
        private CharactersModel charactersModel;
        public CharactersPage()
        {
            InitializeComponent();
            charactersModel = new CharactersModel();
            CharacterNamesCB.ItemsSource = charactersModel.Characters;
            CharacterNamesCB.SelectedIndex = 0;
        }

        private void CharacterNamesCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
