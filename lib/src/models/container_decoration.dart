import 'package:flutter/material.dart';
import '../../src/theme/constant_colors.dart';

final BoxDecoration containerDecoration = _buildContainerDecoration();

BoxDecoration _buildContainerDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: backgroundWhite,
    boxShadow: [
      BoxShadow(
        color: Color(0xFF989898).withOpacity(.5),
        offset: Offset(5, 7),
        blurRadius: 7,
      )
    ],
  );
}
