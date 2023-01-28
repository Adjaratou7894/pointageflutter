import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int _selectedIndex = 0;

  List<Widget> _tabPages = [
    Text('Page 1'),
    Text('Page 2'),
    Text('Page 3'),
    Text('Page 4'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tab Bar'),
      ),
      body: _tabPages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            //icon: Text('Accueil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            //icon: Text('Pointage'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            //title: Text('Permission'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            //title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
