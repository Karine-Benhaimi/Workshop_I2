import 'package:flutter/material.dart';
import 'package:projet_inno/main.dart';
import 'package:projet_inno/localisation.dart';
import 'package:projet_inno/Setting.dart';
import 'package:projet_inno/SignalerDauphinScreen.dart';
import 'package:projet_inno/Statistiques.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalisationScreen extends StatelessWidget {

  GoogleMapController? mapController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map !'),
          backgroundColor: Color(0xFF093B7D),
        ),



      //Map
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Coordonnées du centre de la carte
          zoom: 10.0, // Niveau de zoom initial
        ),
      ),
























      //Bare des taches
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

