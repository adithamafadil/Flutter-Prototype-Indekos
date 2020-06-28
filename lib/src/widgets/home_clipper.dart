import 'package:flutter/material.dart';

class HomeClipper extends StatelessWidget {
  final double queryHeight;
  HomeClipper({@required this.queryHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * queryHeight,
      child: Image.network(
        'https://images.unsplash.com/photo-1558882224-dda166733046?ixlib=rb-1.2.1&auto=format&fit=crop&w=749&q=80',
        // 'https://images.unsplash.com/photo-1534595038511-9f219fe0c979?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withOpacity(.65),
      ),
    );
  }
}
