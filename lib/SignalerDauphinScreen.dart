import 'package:flutter/material.dart';
import 'package:projet_inno/main.dart';
import 'package:projet_inno/localisation.dart';
import 'package:projet_inno/Setting.dart';
import 'package:projet_inno/SignalerDauphinScreen.dart';
import 'package:projet_inno/Statistiques.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SignalerDauphinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signaler un dauphin'),
        backgroundColor: Color(0xFF093B7D),
      ),
      // Contenu de l'écran "Signaler un dauphin"





      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Color(0xFF093B7D),
        unselectedItemColor: Colors.grey,
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