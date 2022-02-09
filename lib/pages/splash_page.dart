import 'dart:async';

import 'package:flutter/material.dart';
import 'package:renta/pages/login_page.dart';

import 'package:renta/utils/color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 600), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child:  Image.asset("assets/images/rentalogo.png",height: 50,),
        ),
      ),
    );
  }
}
