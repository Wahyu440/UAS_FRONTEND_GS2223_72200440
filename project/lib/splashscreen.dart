import 'package:flutter/material.dart';
import 'package:uas_frontend_gs2223_72200440/homeDrawer.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key, required this.title});

  final String title;

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  startSplashscreen() async {
    var duration = new Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeDrawer())
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Image.asset(
          "images/logoipsum.png",
          width: 100.0,
          height: 100.0,
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    startSplashscreen();
  }
}