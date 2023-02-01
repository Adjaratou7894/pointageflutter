import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
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
                  // margin: const EdgeInsets.only(top: 40),
                  margin: EdgeInsets.all(10),
                  height: hauteur * 0.3,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: hauteur * 0.19,
                  color: Colors.yellow,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    // height: hauteur*0.8,
                    color: Colors.grey,
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
