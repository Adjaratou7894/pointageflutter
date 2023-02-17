import 'dart:math';
import 'package:quickalert/quickalert.dart';

import 'package:flutter/material.dart';
import 'package:pointageflutter/Controllers/pointageController.dart';
import 'package:pointageflutter/accueil.dart';
import 'package:pointageflutter/connexion.dart';
import 'package:pointageflutter/pointage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointageflutter/profil.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:convert';
import '../services/globals.dart';

import 'package:http/http.dart' as http;

import 'historiqueDemande.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key}) : super(key: Key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  final Geolocator geolocator = Geolocator();
  late Position _currentPosition;
  late String _currentAddress;
  int _selectedIndex = 0;

  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Accueil',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Pointage',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Permission',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Profil', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        print('-------------------index 1------------------');

        verificationgeolocation(context);
      }
      _selectedIndex = index;
    });
  }

  final List<Widget> _mesPages = [
    Accueil(),
    Pointage(),
    Permission(),
    Profil(),
  ];
//  cette methode permet de  recuperer l'id de l'utilisateur qui est connecté
  @override
  void initState() {
    super.initState();
    usId;

    // Définir une minuterie pour demain à minuit pour activer le bouton automatique demain

    var now = DateTime.now();
    var tomorrow = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    var duration = tomorrow.difference(now);
    Timer(duration, () {
      setState(() {
        _isButtonDisabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex == 1 ? _mesPages[0] : _mesPages[_selectedIndex],
        //  child:  _selectedIndex == 3? const Profil() : _mesPages[_selectedIndex]
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -2),
              blurRadius: 8,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Pointage',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Permission',
              // icon: Image.asset(
              //   'assets/images/dem.png',
              //   // height: 70,
              // ),
              // label: "Permission"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profil',
              // icon: Image.asset(
              //   'assets/images/profil.png',
              //   // height: 70,
              // ),
              // label: "Profil"
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFF58220),
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
// la methode  pour verifier la geolocation de l'apprenant

void verificationgeolocation(BuildContext context) async {
  print('-------------------verification------------------');

  // _getCurrentLocation();
  Geolocator geolocator = Geolocator();

  var _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  // double OdcLatitude = 12.56639;
  // double OdcLongitude = 7.99343;
  double OdcLatitude2 = 37.4219999;
  double OdcLongitude2 = -122.0840575;
  double distanceInMeters;
  double k = 1.182 * 60;
  // var _currentPosition;
  double latitudeDiff = (_currentPosition.latitude - OdcLatitude2);
  double longitudeDiff = (_currentPosition.longitude - OdcLongitude2) *
      cos((_currentPosition.latitude + OdcLatitude2) / 2);
  double z = sqrt(latitudeDiff * latitudeDiff + longitudeDiff * longitudeDiff);
  distanceInMeters = k * z;
  print('-------------------distance In Meters------------------');
  print(distanceInMeters);
  if (distanceInMeters <= 100) {
    print("je suis à ODC");
    showFancyCustomDialog(context);
  } else {
    print("je suis à la maison");
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Erreur...',
      text: 'Desole, Veuillez etre à ODC pour vous pointez',
    );
  }
}
// void verification(BuildContext context) {
//   var test;
//   if (test <= 100) {
//     showFancyCustomDialog(context);
//   } else {
//     _showOutOfRangeDialog();
//   }
// }

_getCurrentLocation() async {
  var geolocator;
  var _currentPosition = await geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}

// showOutOfRangeDialog() {
//   var context;
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text(
//               'Veuillez être dans les locaux Orange Digital Center pour vous pointez .'),
//         );
//       });
// }

// Popup pour le pointage contenant l'heure arrivee et de depart
void showFancyCustomDialog(BuildContext context) {
  var id = usId;
  var idpointage = pointageId;
  var longitude = 10.2;
  var latitude = 20.0;

  double hauteur = MediaQuery.of(context).size.height;
  double largeur = MediaQuery.of(context).size.width;
  Dialog fancyDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 300.0,
      width: 350.0,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              'Veuillez vous positionner pour un capture d’écran de votre identité après avoir Votre heure de pointage',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 150),
            width: double.infinity,
            height: hauteur * .30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: <Widget>[
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
                  ),
                  onPressed: () {
                    print(id);
                    PointageController().sauvegarderPointage(id);
                    // PointageController(). (id);
                    print('est ok');

                    _isButtonDisabled = true;
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Pointage effectuée avec succès!',
                    );
                  },
                  icon: Icon(Icons.login),
                  label: Text(
                    'Heure d\'arrivée',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFF58220)),
                  ),
                  onPressed: () {
                    print(idpointage);

                    PointageController().sauvegarderPointageFin();
                    print('est ok');
                    _isButtonDisabled = true;
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Pointage effectuée avec succès!',
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: Text(
                    'Heure de départ',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            // These values are based on trial & error method
            alignment: Alignment(1.05, -1.05),
            // alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => fancyDialog);
}

// Pour desactiver le bouton heure d'arrivée
bool _isButtonDisabled = true;
bool canClickButton() {
  var now = DateTime.now();
  var hour = now.hour;
  return _isButtonDisabled && hour >= 6 && hour <= 12;
}

// Pour desactiver le bouton heure de fin
bool canClickButtonfin() {
  var now = DateTime.now();
  var hour = now.hour;
  return _isButtonDisabled && hour >= 17 && hour <= 18;
}
