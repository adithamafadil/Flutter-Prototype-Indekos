import 'package:flutter/material.dart';

import '../../src/models/container_decoration.dart';

class CardContainer extends StatelessWidget {
  final Widget title;
  final double height;

  CardContainer({this.title, @required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        decoration: containerDecoration,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: title,
        ),
      ),
    );
  }
}
