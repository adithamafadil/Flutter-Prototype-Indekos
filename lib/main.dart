import 'package:flutter/material.dart';

import './src/theme/theme.dart';
import './src/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => Loginscreen(),
        '/home': (context) => Homescreen(),
      },
    );
  }
}
