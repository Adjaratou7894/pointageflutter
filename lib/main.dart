import 'package:flutter/material.dart';
import 'package:pointageflutter/accueil.dart';
import 'package:pointageflutter/premiersplashscreen.dart';
import 'package:pointageflutter/profil.dart';
import 'package:pointageflutter/splashscreen.dart';

import 'connexion.dart';
import 'menuTabBar.dart';
import 'notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Splash(),
      // home: const PremierSplash(),
      // home: const Connexion(),
      // home: const Accueil(),
      // home: PopupPointage(),

      // home: MyNavigationBar(),
      // home: Notifications(),
      home: const Profil(),
    );
  }
}
