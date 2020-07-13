import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './src/theme/theme.dart';
import './src/screens/screens.dart';
import './src/provider/reserve_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReserveProvider>(
          create: (_) => ReserveProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => Homescreen(),
          '/account': (context) => AccountScreen(),
        },
      ),
    );
  }
}
