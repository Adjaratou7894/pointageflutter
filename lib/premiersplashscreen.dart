import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pointageflutter/splashscreen.dart';

class PremierSplash extends StatefulWidget {
  const PremierSplash({super.key});

  @override
  State<PremierSplash> createState() => _PremierSplashState();
}

class _PremierSplashState extends State<PremierSplash> {
  @override
  void initState() {
    //on recupère le user courant avec le provider
    //final user = Provider.of<AppUser>(context);
    // ignore: todo
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (context) => const Splash(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 400,
          width: double.infinity,
          //color: Colors.red,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/flash.png"),
                  fit: BoxFit.cover)),
        ),
        Expanded(
            child: Column(
          children: [
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.center,
              height: 150,
              width: 180,
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage('assets/images/logoP.png'))),
            ),
            // const SizedBox(height: 50.0),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: const Text('ODC Pointeur',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ),
            // const SizedBox(height: 20.0),
          ],
        )),
      ]),
    );
  }
}
