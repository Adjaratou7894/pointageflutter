import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pointageflutter/accueil.dart';
import 'package:pointageflutter/connexion.dart';
import 'package:pointageflutter/pointage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointageflutter/profil.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

import 'historiqueDemande.dart';

class MyNavigation extends StatefulWidget {
  MyNavigation({Key}) : super(key: Key);

  @override
  _MyNavigationState createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
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
        showFancyCustomDialog(context);
      }
      _selectedIndex = index;
    });
  }

  final List<Widget> _mesPages = [
    Accueil(),
    Container(),
    Container(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: _selectedIndex == 1 ? _mesPages[0] : _mesPages[_selectedIndex],
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
              label: 'Listes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Sanctions',
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

void _verificationgeolocation(BuildContext context) async {
  // _getCurrentLocation();
  var geolocator;
  var _currentPosition = await geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  double OdcLatitude = 12.654200;
  double OdcLongitude = -7.998900;
  // var _currentPosition;
  double latitudeDiff = _currentPosition.latitude - OdcLatitude;
  double longitudeDiff = _currentPosition.longitude - OdcLongitude;
  double distanceInMeters =
      sqrt(latitudeDiff * latitudeDiff + longitudeDiff * longitudeDiff);

  print('-------------------distance In Meters------------------');
  print(distanceInMeters);
  if (distanceInMeters <= 100) {
    showFancyCustomDialog(context);
  } else {
    _showOutOfRangeDialog();
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

_showOutOfRangeDialog() {
  var context;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
              'Veuillez être dans les locaux Orange Digital Center pour vous pointez .'),
        );
      });
}

// Popup pour le pointage contenant l'heure arrivee et de depart
void showFancyCustomDialog(BuildContext context) {
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
                  onPressed: () {},
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
                  onPressed: () {},
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
