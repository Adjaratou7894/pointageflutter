import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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

          child: Text(
            'Bienvenue',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
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
            const SizedBox(height: 80.0),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: const Text('Pointez en toute simplicité',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    )),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        )),
      ]),
    );
  }
}
