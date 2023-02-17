import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pointageflutter/Controllers/AuthController.dart';
import 'package:pointageflutter/models/ListeData.dart';
import 'package:pointageflutter/models/demande.dart';
import 'package:pointageflutter/services/globals.dart';
import 'package:quickalert/quickalert.dart';
import 'package:select_form_field/select_form_field.dart';

import 'Controllers/DemandeController.dart';

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  List<DemandePermission> demandepermissions = [];
  getDemandePermission(id) async {
    demandepermissions = await DemandeController.listedemande(id);
  }

  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xFFF58220),
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   // title: Text("Notification"),
        //   title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //     Text("Notification",
        //         style: GoogleFonts.poppins(
        //             textStyle: const TextStyle(fontSize: 30.0))),
        //   ]),
        //   elevation: 0,
        // ),
        appBar: AppBar(
          backgroundColor: Color(0xFFF58220),
          centerTitle: true,
          title: Text(
            'Mes demandes',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 17,
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
                padding: EdgeInsets.all(12),
                // padding: const EdgeInsets.only(right: 12.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    showDataAlert();
                  },
                  child: Text('Faire Demande',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                )
                // child: IconButton(
                //   icon: Icon(Icons.not_interested),
                //   onPressed: () {
                //     // Navigator.pop(context);
                //   },
                // ),
                )
          ],
        ),
        backgroundColor: Color(0xFFF58220),
        body: Container(
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
                    autorisation(largeur, hauteur, true),
                    autorisation(largeur, hauteur, false),
                    autorisation(largeur, hauteur, true),
                    autorisation(largeur, hauteur, false),
                    autorisation(largeur, hauteur, true),
                  ],
                ),
              )
            ]),
          ),
        ));
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
                                  Text("Fatoumata Kaloga",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    width: largeur * 0.02,
                                  ),
                                  Text("01/02/2023",
                                      style: GoogleFonts.poppins(
                                          textStyle:
                                              const TextStyle(fontSize: 15.0))),
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
                                            "Votre formatrice a validée votre demande de permission ",
                                            // textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              fontSize: 14.0,
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
  // popup qui s'affiche lorsque nous allons faire une demande de permission

  showDataAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return const Ttttt();
        });
  }
}

class Ttttt extends StatefulWidget {
  const Ttttt({super.key});

  @override
  State<Ttttt> createState() => _TttttState();
}

class _TttttState extends State<Ttttt> {
  bool descriptionMotif = false;
  bool erreur = false;
  String motifController = "";
  DemandeController demandeController = DemandeController();

  var id = usId;
  final formKey = GlobalKey<FormState>();

  final descriptionMotifController = TextEditingController();
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Retard',
      'label': 'Retard',
      'icon': Icon(Icons.safety_check),
    },
    {
      'value': 'Absence',
      'label': 'Absence',
      'icon': Icon(Icons.date_range),
      'textStyle': TextStyle(color: Colors.red),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      contentPadding: EdgeInsets.only(
        top: 10.0,
      ),
      title: Row(
        children: [
          Text(
            "Ecrire une demande",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(width: 5),
          Align(
            // These values are based on trial & error method
            // alignment: Alignment.topLeft,
            // alignment: Alignment(1.05, -1.05),
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
      content: Container(
        height: 400,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Choisir le type de demande ",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      // color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 5),
                  child: SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    initialValue: 'circle',
                    icon: Icon(Icons.security),
                    labelText: 'Motif',
                    items: _items,
                    onChanged: (val) => motifController = val,
                    onSaved: (val) => motifController = val!,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: descriptionMotifController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'details du motif ',
                      labelText: 'Description du motif'),

                  //  validator: (value) =>
                  //   value!.trim().isEmpty
                  //       ?"svp veuillez saisir une description"
                  //       : null,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        descriptionMotif = true;
                        erreur = false;
                      });
                    } else {
                      setState(() {
                        descriptionMotif = false;
                      });
                    }
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (motifController != "" &&
                        // ignore: unrelated_type_equality_checks
                        descriptionMotifController.text != "") {
                      //--------------avant-----------------------
                      demandeController.permission(
                          id, motifController, descriptionMotifController.text);
                      //-----------------------reponse--------------------------
                      var response = await demandeController.permission(
                          id, motifController, descriptionMotifController.text);

                      if (response.statusCode == 200) {}
                    } else {
                      setState(() {
                        descriptionMotif = true;
                        erreur = true;
                      });
                    }

                    // if (formKey.currentState.validate()) {
                    // Traitement des données ici
                    // }

                    // Navigator.of(context).pop();

                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Demande effectuée avec succès!',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF58220),
                    // fixedSize: Size(250, 50),
                  ),
                  child: Text(
                    "Soumettre",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Note',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Votre présence joue un role important dans la formation, l\'esprit d\'equipe',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      // color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
