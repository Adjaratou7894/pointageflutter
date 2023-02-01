import 'package:flutter/material.dart';
import 'package:pointageflutter/accueil.dart';
import 'package:pointageflutter/connexion.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key}) : super(key: Key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Accueil',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Pointage',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Permission',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Profil', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _mesPages = [
    Accueil(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text('Flutter BottomNavigationBar Example'),
      //     backgroundColor: Colors.green),
      body: Center(
        child: _mesPages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -2),
              blurRadius: 8,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Pointage',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Permission',
              // icon: Image.asset(
              //   'assets/images/dem.png',
              //   // height: 70,
              // ),
              // label: "Permission"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profil',
              // icon: Image.asset(
              //   'assets/images/profil.png',
              //   // height: 70,
              // ),
              // label: "Profil"
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFF58220),
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
