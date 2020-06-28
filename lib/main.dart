import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './src/theme/theme.dart';
import './src/provider/like_provider.dart';
import './src/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LikeProvider>(create: (_) => LikeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => Loginscreen(),
          '/home': (context) => Homescreen(),
          '/detail': (context) => Detailscreen(),
          '/payment': (context) => Paymentscreen(),
          '/confirmed': (context) => Confirmedscreen(),
        },
      ),
    );
  }
}
