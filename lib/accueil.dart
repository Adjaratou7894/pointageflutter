import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointageflutter/notification.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF58220),
      body: Column(
        children: [
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
            child: Column(children: [
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
                    Expanded(
                        child: Container(
                      // color: Colors.orangeAccent,
                      //  mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      alignment: Alignment.centerLeft,

                      child: const Text(
                        "Sanctions",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'DayRoman',
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                // color: Colors.blue,
                                child: const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xFFF58220),
                                  child: ImageIcon(
                                      color: Colors.white,
                                      AssetImage("assets/images/retard.png")),
                                ),
                              )),
                          Expanded(
                              flex: 5,
                              child: Container(
                                child: const Text(
                                  "Pour retard",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'DayRoman',
                                  ),
                                ),
                                // color: Colors.purple,
                              )),
                          Expanded(
                              flex: 4,
                              child: Container(
                                width: 80,
                                height: 30,
                                // color: Colors.white,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("assets/images/mm.png"),
                                )),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: const Text(
                                  "3/6",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF58220),
                                    fontFamily: 'DayRoman',
                                  ),
                                ),
                                // color: Colors.purple,
                              )),
                        ],
                      ),
                      // color: Colors.yellow,
                    )),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                // color: Colors.blue,
                                child: const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xFF2A528F),
                                  child: ImageIcon(
                                      color: Colors.white,
                                      AssetImage("assets/images/Absence.png")),
                                ),
                              )),
                          Expanded(
                              flex: 5,
                              child: Container(
                                child: const Text(
                                  "Pour Absence",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'DayRoman',
                                  ),
                                ),
                                // color: Colors.purple,
                              )),
                          Expanded(
                              flex: 4,
                              child: Container(
                                width: 80,
                                height: 30,
                                // color: Colors.white,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("assets/images/aa.png"),
                                )),
                              )),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerRight,

                              child: const Text(
                                "3/6",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2A528F),
                                  fontFamily: 'DayRoman',
                                ),
                              ),

                              // color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                      // color: Colors.blue,
                    )),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                // color: Colors.blue,
                                child: const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.black,
                                  child: ImageIcon(
                                      color: Colors.white,
                                      AssetImage("assets/images/autre.png")),
                                ),
                              )),
                          Expanded(
                              flex: 5,
                              child: Container(
                                child: const Text(
                                  "Pour Autre",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'DayRoman',
                                  ),
                                ),
                                // color: Colors.purple,
                              )),
                          Expanded(
                              flex: 4,
                              child: Container(
                                // width: 80,
                                // height: 30,
                                // color: Colors.white,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("assets/images/dd.png"),
                                  // fit: BoxFit.cover
                                )),
                              )),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerRight,

                              child: const Text(
                                "3/6",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'DayRoman',
                                ),
                              ),

                              // color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                      // color: Colors.yellow,
                    )),
                  ],
                ),
              ))
            ]),
          ))
        ],
      ),
    );
  }
}
