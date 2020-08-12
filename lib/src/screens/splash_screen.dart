import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goMainScreen();
  }

  Future<Timer> goMainScreen() async {
    return Timer(Duration(milliseconds: 3300), onDoneControl);
  }

  onDoneControl() async {
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (context) => Loginscreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 100),
              SizedBox(height: 24),
              Text("PT. Busur Rukun Mandiri", style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      )),
    );
  }
}
