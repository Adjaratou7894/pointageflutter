import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(children: [
        Container(
          color: Colors.orange,
          height: 50,
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
                margin: const EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                child: const Text(
                  'Connexion',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'DayRoman',
                  ),
                ),
              ),
              Container(
                height: 5,
                width: 76,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                // padding:
                // const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color.fromARGB(255, 247, 118, 6)),
                    left: BorderSide(color: Color.fromARGB(255, 247, 118, 6)),
                    right: BorderSide(color: Color.fromARGB(255, 247, 118, 6)),
                    bottom: BorderSide(color: Color.fromARGB(255, 247, 118, 6)),
                  ),
                  color: Color.fromARGB(255, 247, 118, 6),
                ),
              ),
              const SizedBox(height: 50.0),
              Container(
                alignment: Alignment.center,
                height: 185,
                width: 300,
                //width: double.infinity,
                //color: Colors.red,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/login.png"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: 50.0),

              //champ input et bouton
              Container(
                width: 350,
                // color: Colors.blue,
                decoration: const BoxDecoration(
                  color: Colors.white,

                  // borderRadius: BorderRadius.circular(10.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 8,
                      offset: Offset(-1, 1),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    // border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                    labelText: 'Veuillez saisir votre username',
                  ),
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'Entrez votre nom';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                width: 350,
                // color: Colors.blue,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(10.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 8,
                      offset: Offset(-1, 1),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                    labelText: 'Veuillez saisir votre mot de passe',
                  ),
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'Entrez votre nom';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  // color: Colors.white,
                  // borderRadius: BorderRadius.circular(10.0),
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(20),
                  //   bottomRight: Radius.circular(20),
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45.withOpacity(0.3),
                      blurRadius: 20,
                      // offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 247, 118, 6)),
                  ),
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {
                    // Traitement des données ici
                    // }
                  },
                  child: const Text(
                    'Valider',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Container(
                    width: 250,
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(top: 60),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      // borderRadius: BorderRadius.circular(10.0),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(20),
                      //   bottomRight: Radius.circular(20),
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 0, 0, 0)),
                      ),
                      onPressed: () {
                        // if (_formKey.currentState.validate()) {
                        // Traitement des données ici
                        // }
                      },
                      child: const Text(
                        'Mot de passe oublié ?',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: largeur * .05,
                  )
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
