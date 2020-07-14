import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomestayType extends StatelessWidget {
  final String imagePath;
  final String desc;
  final GestureTapCallback onTap;

  HomestayType({this.desc, this.imagePath, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              child: SvgPicture.asset(
                imagePath,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
            SizedBox(height: 5),
            Text(desc),
          ],
        ),
      ),
    );
  }
}
