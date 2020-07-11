import 'package:flutter/material.dart';

import '../../src/theme/constant_colors.dart';

class CustomDropDown extends StatelessWidget {
  final Widget child;
  CustomDropDown({@required this.child}) : assert(child != null);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundWhite,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
        ),
        child: child,
      ),
    );
  }
}
