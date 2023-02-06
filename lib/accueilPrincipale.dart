import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointageflutter/notification.dart';

class AccueilPrincipale extends StatefulWidget {
  const AccueilPrincipale({super.key});

  @override
  State<AccueilPrincipale> createState() => _AccueilPrincipaleState();
}

class _AccueilPrincipaleState extends State<AccueilPrincipale> {
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF58220),
      body: Column(children: [
        Container(
          color: Color(0xFFF58220),
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
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 80,
                // width: 20,
                // color: Colors.blueAccent,

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        //alignment: Alignment.center,
                        color: Color(0xFFF4F4F4),
                        width: largeur * 0.5,
                        height: hauteur * 0.06,
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   borderRadius: BorderRadius.circular(10.0),
                        // ),

                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFFF58220),
                              radius: 16.0,
                            ),
                            SizedBox(
                              width: largeur * 0.02,
                            ),
                            Text(
                              'Kalanso',
                              style: TextStyle(
                                fontSize: 30,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'DayRoman',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        // margin: EdgeInsets.only(left: 20),

                        // child: IconButton(
                        //   iconSize: 72,
                        //   icon: const Icon(Icons.favorite),
                        //   onPressed: () {
                        //     // ...
                        //   },
                        // ),

                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFF58220)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Notifications()));
                          },
                          icon: Icon(
                            // <-- Icon
                            Icons.notifications,
                            size: 30.0,
                          ),
                          label: Text(''), // <-- Text
                        ),
                      ),
                    ),
                    SizedBox(
                      width: largeur * 0.05,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0),
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
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        // color: Colors.blue,
                        height: 20,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text(
                              'Statistique: Durée de la formation',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'DayRoman',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: const [
                                Text(
                                  '3 mois 25 jours',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'DayRoman',
                                  ),
                                ),
                                Expanded(
                                  child: CircleAvatar(
                                    radius: 33,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xFF23D635),
                                      radius: 30.0,
                                      child: Text(
                                        '54%',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: 'DayRoman',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            // margin: const EdgeInsets.only(top: 5),
                            child: const Text(
                              'Sur 6 mois ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'DayRoman',
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 313,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(10.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  // color: Colors.purple,
                                  // height: 50,
                                  // width: 50,
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color(0xFFF58220),
                                            child: ImageIcon(
                                                color: Colors.white,
                                                AssetImage(
                                                    "assets/images/presence .png")),
                                          ),
                                          SizedBox(
                                            width: largeur * 0.02,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              '90 jours',
                                              style: TextStyle(
                                                fontSize: 12,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontFamily: 'DayRoman',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    const Text(
                                      "Total Presence",
                                      style: TextStyle(
                                        fontSize: 15,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'DayRoman',
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // color: Colors.purple,
                                  // height: 50,
                                  // width: 50,
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color(0xFFF58220),
                                            child: ImageIcon(
                                                color: Colors.white,
                                                AssetImage(
                                                    "assets/images/retard.png")),
                                          ),
                                          SizedBox(
                                            width: largeur * 0.02,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              '15',
                                              style: TextStyle(
                                                fontSize: 15,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontFamily: 'DayRoman',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    const Text(
                                      "Total Retard",
                                      style: TextStyle(
                                        fontSize: 15,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'DayRoman',
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // color: Colors.purple,
                                  // height: 50,
                                  // width: 50,
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color(0xFFF58220),
                                            child: ImageIcon(
                                                color: Colors.white,
                                                AssetImage(
                                                    "assets/images/Absence.png")),
                                          ),
                                          SizedBox(
                                            width: largeur * 0.02,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              '0',
                                              style: TextStyle(
                                                fontSize: 15,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontFamily: 'DayRoman',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    const Text(
                                      "Total Absence",
                                      style: TextStyle(
                                        fontSize: 15,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'DayRoman',
                                      ),
                                    )
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 19),
                // margin: const EdgeInsets.only(top: 10),
                // color: Colors.orangeAccent,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
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
                          // margin: EdgeInsets.all(5),
                          margin: EdgeInsets.only(left: 20),
                          // color: Colors.orangeAccent,
                          height: hauteur * .15,
                          // width: largeur * .8,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.black,
                                child: ImageIcon(
                                    color: Colors.white,
                                    AssetImage("assets/images/retard.png")),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
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
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.grey),
                                ),
                                onPressed: () {
                                  // if (_formKey.currentState.validate()) {
                                  // Traitement des données ici
                                  // }
                                },
                                child: const Text(
                                  'Se pointer',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    //fin de du pointage
                    SizedBox(
                      height: hauteur * 0.02,
                    ),
                    // demande de permission
                    Stack(
                      children: [
                        Container(
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
                          // margin: EdgeInsets.all(5),
                          margin: EdgeInsets.only(left: 20),
                          // color: Colors.orangeAccent,
                          height: hauteur * .15,
                          // width: largeur * .8,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Color(0xFFFF0101),
                                child: ImageIcon(
                                    color: Colors.white,
                                    AssetImage("assets/images/retard.png")),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
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
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.grey),
                                ),
                                onPressed: () {
                                  // if (_formKey.currentState.validate()) {
                                  // Traitement des données ici
                                  // }
                                },
                                child: const Text(
                                  'Demander une permission',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                // color: Colors.yellow,
              )),
            ],
          ),
        ))
      ]),
    );
  }
}
