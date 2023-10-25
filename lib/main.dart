import 'package:flutter/material.dart';
import 'package:projet_inno/main.dart';
import 'package:projet_inno/localisation.dart';
import 'package:projet_inno/Setting.dart';
import 'package:projet_inno/SignalerDauphinScreen.dart';
import 'package:projet_inno/Statistiques.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  int _currentIndex = 0; // Indice actuel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue sur SecuDauphin !'),
        backgroundColor: Color(0xFF093B7D),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/mon-logo.png', width: 200, height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignalerDauphinScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF093B7D), // Définissez la couleur de fond ici
              ),
              child: Text('Signaler un dauphin'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatistiquesScreen(),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                primary: Color(0xFF093B7D), // Définissez la couleur de fond ici
              ),
              child: Text('Statistiques'),
            ),
          ],
        ),
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
          }// Mettez à jour l'indice actuel

        },
      ),
    );
  }
}




