import 'package:flutter/material.dart';
import 'package:pointageflutter/accueil.dart';
import 'package:pointageflutter/models/ListeData.dart';
import 'package:pointageflutter/pointage.dart';
import 'package:pointageflutter/premiersplashscreen.dart';
import 'package:pointageflutter/profil.dart';
import 'package:pointageflutter/splashscreen.dart';
import 'package:provider/provider.dart';

import 'accueilPrincipale.dart';
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
    return ChangeNotifierProvider<ListeData>(
      create: (context) => ListeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ODC Pointeur',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const Splash(),
        home: const PremierSplash(),
        // home: const Connexion(),
        // home: const Accueil(),
        // home: const Pointage(),
        // home: const AccueilPrincipale(),

        // home: MyNavigationBar(),
        // home: Notifications(),
        // home: const Profil(),
      ),
    );
  }
}
