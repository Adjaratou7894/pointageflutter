import 'package:flutter/material.dart';
import 'package:pointageflutter/Controllers/AuthController.dart';
import 'package:pointageflutter/accueil.dart';

import 'menuTabBar.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    // la partie pour appeler le controller dans la page
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    AuthController authController = AuthController();

    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF58220),
      appBar: AppBar(
        backgroundColor: Color(0xFFF58220),
        elevation: 0,
        toolbarHeight: size.height * .05,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            //height: size.height,
            child: Column(
          children: [
            Container(
              height: size.height * .870391,
              width: size.width,
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
                      top: BorderSide(
                        color: Color(0xFFF58220),
                      ),
                      left: BorderSide(
                        color: Color(0xFFF58220),
                      ),
                      right: BorderSide(
                        color: Color(0xFFF58220),
                      ),
                      bottom: BorderSide(
                        color: Color(0xFFF58220),
                      ),
                    ),
                    color: Color(0xFFF58220),
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
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      // enabledBorder: OutlineInputBorder(),
                      // focusedBorder: OutlineInputBorder(),
                      // border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                      ),
                      // labelText: 'Veuillez saisir votre username',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'svp veuillez saisir votre username';
                      }
                      return null;
                    },
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
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      // enabledBorder: OutlineInputBorder(),
                      // focusedBorder: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                      ),
                      // labelText: 'Veuillez saisir votre mot de passe',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'svp veuillez saisir password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30.0),
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
                        Color(0xFFF58220),
                      ),
                    ),
                    onPressed: () {
                      authController.Connexion(
                          usernameController.text, passwordController.text);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MyNavigationBar()));
                      // if (_formKey.currentState.validate()) {
                      // Traitement des données ici
                      // }
                    },
                    child: const Text(
                      'Se connecter',
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
                      margin: EdgeInsets.only(top: 50),
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
            )
          ],
        )),
      ),
    );
  }
}
