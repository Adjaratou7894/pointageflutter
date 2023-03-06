import 'dart:async';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pointageflutter/AffichageDemande.dart';
import 'package:pointageflutter/Controllers/AuthController.dart';
import 'package:pointageflutter/accueil.dart';
import 'package:pointageflutter/menuTabBar.dart';
import 'package:pointageflutter/models/ListeData.dart';
import 'package:pointageflutter/models/demande.dart';
import 'package:pointageflutter/services/globals.dart';
import 'package:provider/provider.dart';
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
  getDemandePermission() async {
    demandepermissions = await DemandeController.listedemande();
    Provider.of<ListeData>(context, listen: false).demandepermissions =
        demandepermissions;
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    getDemandePermission();
  }

  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return demandepermissions == null
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyNavigationBar(),
                    ),
                  );
                },
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.all(12),
                    // padding: const EdgeInsets.only(right: 12.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
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
            // backgroundColor: Color(0xFFF58220),
            body: Container(
              child: Column(children: [
                // Container(
                //   color: Color(0xFFF58220),
                //   height: 10,
                // ),
                Flexible(child: Consumer<ListeData>(
                  builder: (context, ListeData, child) {
                    return SingleChildScrollView(
                      child: Wrap(
                        children: [
                          for (int i = 0; i < demandepermissions.length; i++)
                            AffichageDemande(
                              demandePermission: demandepermissions[i],
                              listeData: ListeData,
                            )
                        ],
                      ),
                    );
                  },
                ))
                // Container(
                //   width: largeur,
                //   decoration: const BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(30),
                //       topRight: Radius.circular(30),
                //     ),
                //   ),
                //   child: Column(
                //     children: [
                //       autorisation(largeur, hauteur, false),

                //     ],
                //   ),
                // )
              ]),
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
  bool demandeactive = false;
  bool descriptionMotif = false;
  bool erreur = false;
  String motifController = "";
  DemandeController demandeController = DemandeController();
  Timer? _timer;

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
  void initState() {
    super.initState();
    usId;

    // Définir une minuterie pour demain à minuit pour activer le bouton automatique demain

    // Start the timer for 24 hours
    _timer = Timer(Duration(hours: 24), () {
      bool demandeactive = false;
    });
  }

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
                        descriptionMotifController.text.trim() != "" &&
                        demandeactive != true) {
                      demandeactive
                          ? QuickAlert.show(
                              context: context,
                              type: QuickAlertType.info,
                              text:
                                  'Une demande est déja soumise pour vous aujourd\' hui ,Impossible de faire deux demandes par jour!')
                          : QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Demande soumise avec succès!');
                      setState(() {
                        !descriptionMotif;
                        erreur = true;

                        demandeactive = true;
                      });
                      //-----------------------reponse--------------------------
                      final response = await demandeController.permission(
                          id, motifController, descriptionMotifController.text);

                      setState(() {
                        descriptionMotifController.text = "";
                      });
                      print(
                          '--------------------voir si ça change----------------------------');

                      // if (response.statusCode == 200) {}
                    }

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: !demandeactive
                        ? Color(0xFFF58220)
                        : Color.fromARGB(255, 0, 0, 0),
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
