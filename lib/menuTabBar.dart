import 'dart:math';
import 'package:quickalert/quickalert.dart';

import 'package:flutter/material.dart';
import 'package:pointageflutter/Controllers/pointageController.dart';
import 'package:pointageflutter/accueil.dart';
import 'package:pointageflutter/pointage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointageflutter/profil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../services/globals.dart';

import 'package:http/http.dart' as http;

import 'historiqueDemande.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key}) : super(key: Key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  bool heureArriver = true;
  Timer? _timer;
  bool heureDepart = false;
  final Geolocator geolocator = Geolocator();
  late Position _currentPosition;
  late String _currentAddress;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        print('-------------------index 1------------------');

        verificationgeolocation(context);
      }
      _selectedIndex = index;
    });
  }

  final List<Widget> _mesPages = const [
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

    // Start the timer for 24 hours
    _timer = Timer(Duration(hours: 24), () {
      heureArriver = true;
      heureDepart = false;
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
          selectedFontSize: 18,
          unselectedFontSize: 18,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

// ------------------------pop----------------------------------------

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
                'Veuillez vous positionner pour une capture d’écran de votre identité après avoir choisir Votre heure de pointage',
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
                      backgroundColor: MaterialStateProperty.all(heureArriver
                          ? Color.fromARGB(255, 0, 0, 0)
                          : Colors.grey),
                    ),

                    // -----------------------start ------------------------------
                    onPressed: () {
                      heureArriver
                          ? PointageController().sauvegarderPointage(id)
                          : null;

                      // PointageController(). (id);
                      Navigator.pop(context);
                      // QuickAlert.show(
                      //         context: context,
                      //         type: QuickAlertType.success,
                      //         text: 'Pointage effectuée avec succès!')

                      heureArriver
                          ? QuickAlert.show(
                              context: context,
                              type: QuickAlertType.info,
                              text:
                                  'Pointage effectuée avec succès,Vous êtes en retard',
                            )
                          : QuickAlert.show(
                              context: context,
                              type: QuickAlertType.info,
                              text:
                                  'Vous etes dejà pointez pour le matin, Bonne Journée',
                            );

                      heureArriver
                          ? setState(() {
                              heureDepart = true;
                              heureArriver = false;
                            })
                          : null;

                      //----------------------- end  ----------------------------
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
                      backgroundColor: MaterialStateProperty.all(
                          !heureDepart ? Colors.red : Color(0xFFF58220)),
                    ),
                    onPressed: () {
                      print(idpointage);
                      heureDepart
                          ? PointageController().sauvegarderPointageFin()
                          : null;
                      print('est ok');

                      // Navigator.pop(context);

                      // heureDepart
                      //     ? QuickAlert.show(
                      //         context: context,
                      //         type: QuickAlertType.success,
                      //         text:
                      //             'Pointage effectuée avec succès , Bonne route!',
                      //       )
                      //     : QuickAlert.show(
                      //         context: context,
                      //         type: QuickAlertType.info,
                      //         text:
                      //             'Vous etes dejà pointez pour le soir, Bonne Soirée',
                      //       );
                      Navigator.pop(context);

                      if (heureDepart) {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          text: 'Pointage effectuée avec succès , Bonne route!',
                        );
                      } else if (!heureDepart && heureArriver) {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          text: 'Veuillez vous pointez pour le matin d\'abord!',
                        );
                      } else {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.info,
                          text:
                              'Vous etes dejà pointez pour le soir, Bonne Soirée',
                        );
                      }

                      setState(() {
                        heureDepart = false;
                      });
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
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }

// -------------------------------------------------------------------

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
    double z =
        sqrt(latitudeDiff * latitudeDiff + longitudeDiff * longitudeDiff);
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

// Pour desactiver le bouton heure d'arrivée
// bool _isButtonPressed = false;
// bool _isButtonPressed1 = true;
// bool firstButtonClicked = true;
// bool canClickButton() {
//   var now = DateTime.now();
//   var hour = now.hour;
//   var seconde = now.second;
//   print("$_isButtonPressed ffggghhhhh");
//   return _isButtonPressed;
//   ;
// }

// Pour desactiver le bouton heure de fin
// bool canClickButtonfin() {
//   var now = DateTime.now();
//   var hour = now.hour;
//   return _isButtonPressed1;
// }


  // // --------------------------methode------------------------------------------
  // Future<PopupMenuItem<String>?> getHeureMinuteArrive() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   heure = sharedPreferences.getInt("heure")!;
  //   minute = sharedPreferences.getString("minute");
  //   String heureArrivee = '$heure:$minute';
  //   if (heure != null && minute != null) {
  //     if (heure > 9) {
  //       print(" heure superieur");
  //       return PopupMenuItem(
  //         value: heureArrivee,
  //         child: Text(
  //           heureArrivee,
  //           style: GoogleFonts.poppins(
  //             textStyle: const TextStyle(
  //               fontSize: 20.0,
  //               color: Colors.black,
  //             ),
  //           ),
  //         ),
  //         // Affiche un info popup si l'heure d'arrivée est supérieure à 9h00
  //          retardErreur(context),
  //       );
  //     } else if (heure < 9) {
  //       QuickAlert.show(
  //         context: context,
  //         type: QuickAlertType.info,
  //         text: 'Erreur',
  //       );
  //     } else {
  //       // L'heure d'arrivée est inférieure à 9h00
  //       QuickAlert.show(
  //           context: context,
  //           type: QuickAlertType.success,
  //           text: 'Pointage effectuée avec succès!');
  //     }
  //   } else {
  //     // Les préférences de l'utilisateur ne contiennent pas d'heure d'arrivée
  //     return null;
  //   }
  // }