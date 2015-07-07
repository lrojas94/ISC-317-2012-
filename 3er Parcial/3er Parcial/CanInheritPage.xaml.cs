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
            housesCB.ItemsSource = CharactersModel.Instance.FormattedHouses;
            housesCB.SelectedIndex = 0;
        }

        private void housesCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string house = (sender as ComboBox).SelectedItem as string;
            Character character = CharactersModel.Instance.InheritorOfHouse(house);
            inheritorName.Content = character.FormattedName;
            houseImage.Source = character.HouseImage;
        }
    }
}
