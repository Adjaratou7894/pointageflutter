import 'dart:math';

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
  // la partie pour appeler le controller dans la page
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController authController = AuthController();
  final formKey = GlobalKey<FormState>();
  String defaut = "Remplir les champs svp";
  String error = "Username ou password incorrect";
  bool username = false;
  bool password = false;
  bool erreur = false;
   bool secret = true;
  @override
  Widget build(BuildContext context) {
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
              child: Form(
                key: formKey,
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
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
                  const SizedBox(height: 10.0),
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
                  !username
                      ? Text(
                          defaut,
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      : Container(),
                  erreur
                      ? Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
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
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none,
                        // enabledBorder: OutlineInputBorder(),
                        // focusedBorder: OutlineInputBorder(ghjkjhgjhg),
                        // border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                        ),
                        labelText: 'username',
                        // hintText: 'Veuillez saisir votre username'
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            username = true;
                            erreur = false;
                          });
                        } else {
                          setState(() {
                            username = false;
                          });
                        }
                      },
                      // validator: (value) =>
                      //     value!.trim().isEmpty || value.trim() == null
                      //         ? error = "svp veuillez saisir votre username"
                      //         : null,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    width: 350,
                    // height: hauteur * .06,
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
                    child: TextField(
                      controller: passwordController,
                       obscureText: secret,
                              style: const TextStyle(fontSize: 22),
                            
                                  
                     
                      decoration:  InputDecoration(
                        suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          secret = !secret;
                                        });
                                      },
                                      icon: Icon(
                                        !secret
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      )),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none,
                        
                        // enabledBorder: OutlineInputBorder(),
                        // focusedBorder: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                        ),
                        //  textAlign: TextAlign.left,

                        labelText: 'mot de passe',
                        // hintText: 'Veuillez saisir votre mot de passe',
                      ),
                      // validator: (value) =>
                      //     value!.trim().isEmpty || value.trim() == null
                      //         ? "svp veuillez saisir password"
                      //         : null,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            password = true;
                          });
                        } else {
                          setState(() {
                            password = false;
                          });
                        }
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
                      onPressed: () async {
                        if (usernameController.text != "" &&
                            passwordController.text != "") {
                          //--------------avant-----------------------
                          authController.Connexion(
                              usernameController.text, passwordController.text);
                          //-----------------------reponse--------------------------
                          var response = await authController.Connexion(
                              usernameController.text, passwordController.text);

                          if (response.statusCode == 200) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyNavigationBar(),
                              ),
                            );
                          }
                        } else {
                          setState(() {
                            username = true;
                            erreur = true;
                          });
                        }

                        // if (formKey.currentState.validate()) {
                        // Traitement des données ici
                        // }
                      },
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: hauteur * .02,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        width: 250,
                        alignment: Alignment.centerRight,
                        // margin: EdgeInsets.only(top: 20),

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
                            // if (formKey.currentState.validate()) {
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
          ],
        )),
      ),
    );
  }
}
