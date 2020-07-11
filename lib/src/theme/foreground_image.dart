import 'package:flutter/material.dart';

BoxDecoration foregroundDecoration(double opacity) {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.black.withOpacity(opacity), Colors.transparent],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );
}
