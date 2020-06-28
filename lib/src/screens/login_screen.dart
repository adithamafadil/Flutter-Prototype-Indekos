import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlineButton(
          onPressed: () => Navigator.pushNamed(context, '/home'),
          child: Text("Will Be Login Button"),
        ),
      ),
    );
  }
}
