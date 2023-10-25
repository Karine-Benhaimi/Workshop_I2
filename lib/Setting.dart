import 'package:flutter/material.dart';
import 'package:projet_inno/main.dart';
import 'package:projet_inno/localisation.dart';
import 'package:projet_inno/SignalerDauphinScreen.dart';
import 'package:projet_inno/Statistiques.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SettingScreen extends StatelessWidget {
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        backgroundColor: Color(0xFF093B7D),
      ),
      body: ListView(
        children: [
          // Icône Paramètres
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/parametre.png', width: 50, height: 50),
                SizedBox(width: 20),
                Text(
                  'Paramètres',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(),

          // Option Langue
          ListTile(
            title: TextWithIcon('Langue'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Ajoutez ici l'action pour la page de sélection de langue
            },
          ),
          Divider(),

          // Option Notification avec icône pour activer/désactiver
          SwitchListTile(
            title: TextWithIcon('Notification'),
            value: true, // Vous pouvez utiliser une variable pour activer/désactiver
            onChanged: (value) {
              // Ajoutez ici la logique pour activer/désactiver les notifications
            },
          ),
          Divider(),

          // Option Mode Nuit avec icône pour activer/désactiver
          SwitchListTile(
            title: TextWithIcon('Mode Nuit'),
            value: true, // Vous pouvez utiliser une variable pour activer/désactiver
            onChanged: (value) {
              // Ajoutez ici la logique pour activer/désactiver le mode nuit
            },
          ),
          Divider(),

          // Option Contacts Utiles
          ListTile(
            title: TextWithIcon('Contacts Utiles'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Ajoutez ici l'action pour la page des contacts utiles
            },
          ),
          Divider(),

          // Option Politique de Confidentialité
          ListTile(
            title: TextWithIcon('Politique de Confidentialité'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Ajoutez ici l'action pour la page de politique de confidentialité
            },
          ),
          Divider(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF093B7D),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Localisation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocalisationScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingScreen()),
            );
          }
        },
      ),
    );
  }
}

class TextWithIcon extends StatelessWidget {
  final String text;

  TextWithIcon(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
