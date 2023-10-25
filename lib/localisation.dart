import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:projet_inno/main.dart';
import 'package:projet_inno/Setting.dart';
import 'package:projet_inno/SignalerDauphinScreen.dart';
import 'package:projet_inno/Statistiques.dart';


class LocalisationScreen extends StatefulWidget {

  @override
  _LocalisationScreenState createState() => _LocalisationScreenState();
}

class _LocalisationScreenState extends State<LocalisationScreen> {
  GoogleMapController? mapController;
  List<Marker> markers = [];
  int _currentIndex = 1;
  @override
  void initState() {
    super.initState();
    loadDolphins(); // Chargez les données des dauphins depuis votre fichier JSON
  }

  Future<void> loadDolphins() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString('assets/dauphins.json'); // Chargez votre fichier JSON
    List<dynamic> data = json.decode(jsonData);

    for (var dolphin in data) {
      markers.add(
        Marker(
          markerId: MarkerId(dolphin['Nom']),
          position: LatLng(dolphin['Emplacement']['Latitude'], dolphin['Emplacement']['Longitude']),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          onTap: () {
            // Afficher les informations du dauphin lorsque le marqueur est cliqué
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Informations sur le dauphin'),
                  content: Text('Nom: ${dolphin['Nom']}\nID: ${dolphin['ID']}\nGenre: ${dolphin['Genre']}\nStatut: ${dolphin['Statut']}'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Fermer'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      );
    }

    setState(() {}); // Mettez à jour l'état pour afficher les marqueurs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map !'),
        backgroundColor: Color(0xFF093B7D),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(47.093145, 2.908851), // Coordonnées du centre de la carte
          zoom: 5.0, // Niveau de zoom initial
        ),
        markers: Set<Marker>.from(markers),
      ),


      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Color(0xFF093B7D),
        unselectedItemColor: Colors.grey,
        currentIndex : _currentIndex,
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