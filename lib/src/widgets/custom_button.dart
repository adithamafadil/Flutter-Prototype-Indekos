import 'package:flutter/material.dart';

import '../../src/theme/constant_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function onPressed;

  CustomButton({this.icon, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FlatButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        splashColor: backgroundWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            SizedBox(width: 5),
            icon,
          ],
        ),
      ),
    );
  }
}
