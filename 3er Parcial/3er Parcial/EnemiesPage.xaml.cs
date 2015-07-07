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
    /// Interaction logic for EnemiesPage.xaml
    /// </summary>
    public partial class EnemiesPage : Page
    {
        public EnemiesPage()
        {
            InitializeComponent();
            this.Measure(new Size(double.PositiveInfinity, double.PositiveInfinity));
            this.Arrange(new Rect(0, 0, this.DesiredSize.Width, this.DesiredSize.Height));

        }

        private void testEnemies_Click(object sender, RoutedEventArgs e)
        {

            characterImageA.Source = null;
            characterImageB.Source = null;
            result.Source = null;

            Character charA = CharactersModel.Instance.FindCharacterWith(characterATB.Text);
            Character charB = CharactersModel.Instance.FindCharacterWith(characterBTB.Text);
            if (charA != null && charB != null)
            {
                characterImageA.Source = charA.HouseImage;
                characterImageB.Source = charB.HouseImage;
                Uri uri;
                if (CharactersModel.Instance.AreEnemies(charA, charB))
                    uri = new Uri("pack://application:,,,/Images/enemies.png");
                else
                    uri = new Uri("pack://application:,,,/Images/friends.png");

                BitmapImage image = new BitmapImage(uri);
                result.Source = image;
            }
            else {
                string message;
                if (charA == null)
                    message = String.Format("No se ha encontrado el personaje {0}", characterATB.Text);
                else
                    message = String.Format("No se ha encontrado el personaje {0}", characterBTB.Text);
                MessageBox.Show(message);
            }
        }
    }
}
