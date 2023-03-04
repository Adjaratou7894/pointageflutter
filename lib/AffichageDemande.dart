import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pointageflutter/Controllers/AuthController.dart';
import 'package:pointageflutter/accueil.dart';
import 'package:pointageflutter/menuTabBar.dart';
import 'package:pointageflutter/models/ListeData.dart';
import 'package:pointageflutter/models/demande.dart';
import 'package:pointageflutter/services/globals.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:select_form_field/select_form_field.dart';

class AffichageDemande extends StatefulWidget {
  AffichageDemande(
      {super.key,
      required,
      required this.demandePermission,
      required this.listeData});
  final DemandePermission demandePermission;
  final ListeData listeData;
  @override
  State<AffichageDemande> createState() => _AffichageDemandeState();
}

class _AffichageDemandeState extends State<AffichageDemande> {
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Color(0xFFF58220),
            height: 10,
          ),
          Container(
            width: largeur,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                autorisation(largeur, hauteur, false),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Container autorisation(double largeur, double hauteur, bool cg) {
    return Container(
        margin: EdgeInsets.all(20),
        // height: 80,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                color: cg ? Color(0xFFD9D9D9) : Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2, -2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: largeur * 0.01,
                  ),
                  Container(

                      //
                      child: Row(
                    children: [
                      // Container(
                      //     // color: Colors.blue,
                      //     // width: largeur * 0.28,
                      //     // height: 20,
                      //     child: const CircleAvatar(
                      //   radius: 28,
                      //   backgroundColor: Colors.orange,
                      //   child: CircleAvatar(
                      //     radius: 25,
                      //     backgroundImage: AssetImage("assets/images/adja.jpg"),
                      //   ),
                      // )
                      // ),
                      // Container(
                      //   color: Colors.yellow,
                      //   width: largeur * 0.5,
                      //   height: 20,
                      // ),
                      SizedBox(
                        width: largeur * 0.02,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("${widget.demandePermission.motif}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    width: largeur * 0.25,
                                  ),
                                  Text(
                                      "${widget.demandePermission.dateSoumission}",
                                      style: GoogleFonts.poppins(
                                          textStyle:
                                              const TextStyle(fontSize: 18.0))),
                                ],
                              ),
                              SizedBox(
                                height: hauteur * 0.01,
                              ),
                              Row(
                                children: [
                                  // Text(
                                  //     "Votre formatrice a validée votre demande de permission ",
                                  //     textAlign: TextAlign.center,
                                  //     style: GoogleFonts.poppins(
                                  //         textStyle: const TextStyle(
                                  //       fontSize: 20.0,
                                  //     ))),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                            widget.demandePermission
                                                .descriptionMotif,
                                            // textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              fontSize: 20.0,
                                            ))),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            )
          ],
        ));
  }
}
