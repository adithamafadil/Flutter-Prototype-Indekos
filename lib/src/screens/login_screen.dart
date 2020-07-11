import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(size: 170),
            SizedBox(height: 60),
            Container(
              width: MediaQuery.of(context).size.width * .5,
              child: OutlineButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/google_logo.png',
                      height: 25,
                    ),
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
