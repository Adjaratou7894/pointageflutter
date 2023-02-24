import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:pointageflutter/services/globals.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  // @override
  // void initState() {
  //   super.initState();
  //   prenomapprenant;
  //   nomapprenant;
  // }

  @override
  Widget build(BuildContext context) {
    final IconData edit = IconData(0xe21a, fontFamily: 'MaterialIcons');
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    String datedujour = getDatedujour();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF58220),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {/* implémentation de la navigation */},
        ),
        // title: Text("Notification"),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Profil",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 30.0))),
        ]),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF58220),
      body: Column(
        children: [
          Container(
            color: Color(0xFFF58220),
            // height: hauteur * 0.01,
          ),
          Expanded(
            child: Container(
              width: largeur,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(children: [
                Container(
                    // alignment: Alignment.center,
                    // margin: const EdgeInsets.only(top: 40),
                    margin: EdgeInsets.all(15),
                    height: hauteur * 0.3,
                    width: largeur,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(15.0),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(20),
                      //   bottomRight: Radius.circular(20),
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // margin: const EdgeInsets.only(top: 40),
                      children: [
                        const CircleAvatar(
                          // margin: const EdgeInsets.only(top: 40),
                          radius: 38,
                          backgroundColor: Color(0xFFF58220),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/images/adja.jpg"),
                          ),
                        ),
                        SizedBox(
                          height: hauteur * 0.01,
                        ),
                        Text('$nomapprenant $prenomapprenant ',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                        Text("Apprenant",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 18.0,
                            ))),
                        SizedBox(
                          height: hauteur * 0.01,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: largeur * 0.29,
                            ),
                            CircleAvatar(
                              // margin: const EdgeInsets.only(top: 40),
                              radius: 29,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      color: Color(0xFFF58220),
                                    ),
                                    onPressed: () {
                                      // L'action à effectuer lorsque l'icône de recherche est appuyée
                                    },
                                  )),
                            ),
                            SizedBox(
                              width: largeur * 0.05,
                            ),
                            CircleAvatar(
                              // margin: const EdgeInsets.only(top: 40),
                              radius: 29,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  edit,
                                  color: Color(0xFFF58220),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                  // margin: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: hauteur * 0.1,
                  // color: Colors.yellow,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("Historique du Pointage",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 30.0,
                                        color: Color(0xFFF58220),
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(
                      //     vertical: 20,
                      //   ),
                      //   child: Divider(
                      //     color: Colors.black,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    // height: hauteur*0.8,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(20),
                      //   bottomRight: Radius.circular(20),
                      // ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, -2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(children: [
                      Container(
                        // color: Colors.red,
                        // height: hauteur * 0.01,
                        // margin: EdgeInsets.only(left: 5, top: 20),

                        child: Row(
                          children: [
                            SizedBox(
                              width: largeur * 0.02,
                            ),
                            Image.asset("assets/images/chronometer.png"),
                            SizedBox(
                              width: largeur * 0.02,
                            ),
                            Text("Formation:",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            SizedBox(
                              width: largeur * 0.25,
                            ),
                            Text("Kalanso 2",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ))),
                          ],
                        ),
                      ),
                      Container(
                        child: Divider(
                          color: Colors.black,
                          height: 15,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      Container(
                        // color: Colors.yellow,

                        child: Row(
                          children: [
                            SizedBox(
                              width: largeur * 0.02,
                            ),
                            Image.asset("assets/images/date.png"),
                            SizedBox(
                              width: largeur * 0.02,
                            ),
                            Text("Date:",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            SizedBox(
                              width: largeur * 0.38,
                            ),
                            Text('$datedujour',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ))),
                          ],
                        ),
                      ),
                      Container(
                        child: const Divider(
                          color: Colors.black,
                          height: 15,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      Container(
                        // color: Colors.green,
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: largeur * 0.03,
                                  ),
                                  Text("statut :",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                      ))),
                                  SizedBox(
                                    width: largeur * 0.19,
                                  ),
                                  Center(
                                    child: Text("Présent",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 25.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  SizedBox(
                                    width: largeur * 0.2,
                                  ),
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Color(0xFF23D635),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: hauteur * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: largeur * 0.02,
                                ),
                                Image.asset("assets/images/arrivee.png"),
                                SizedBox(
                                  width: largeur * 0.02,
                                ),
                                Text("Heure d'arrivée",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  width: largeur * 0.35,
                                ),
                                Text('$heure:$minute',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ))),
                              ],
                            ),
                            SizedBox(
                              height: hauteur * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: largeur * 0.02,
                                ),
                                Image.asset("assets/images/depart.png"),
                                SizedBox(
                                  width: largeur * 0.02,
                                ),
                                Text("Heure de départ",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  width: largeur * 0.35,
                                ),
                                Text('$heured:$minuted',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ))),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: const Divider(
                          color: Colors.black,
                          height: 15,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          //
                          child: Row(
                            children: [
                              SizedBox(
                                width: largeur * 0.01,
                              ),
                              Image.asset("assets/images/valide.png"),
                              SizedBox(
                                width: largeur * 0.02,
                              ),
                              Text("Validé par:",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                              SizedBox(
                                width: largeur * 0.3,
                              ),
                              Text("Nene Sylla",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

String getDatedujour() {
  var now = DateTime.now();
  var formatter = DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(now);
  return formattedDate;
}
