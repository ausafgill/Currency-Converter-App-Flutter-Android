import 'dart:async';

import 'package:currency_converter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image(
                  height: 300,
                  width: 300,
                  image: AssetImage('assets/pngegg.png'))),
          Text(
            'Currency Converter',
            style: GoogleFonts.poppins(
                color: Colors.blue, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          SpinKitDualRing(
            size: 40,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
