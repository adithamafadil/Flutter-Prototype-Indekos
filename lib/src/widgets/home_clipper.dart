import 'package:flutter/material.dart';

import '../../src/widgets/network_image_model.dart';

class HomeClipper extends StatelessWidget {
  final double queryHeight;
  HomeClipper({@required this.queryHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: MediaQuery.of(context).size.height * queryHeight,
      child: NetworkImageModel(
        imageUrl:
            'https://images.unsplash.com/photo-1558882224-dda166733046?ixlib=rb-1.2.1&auto=format&fit=crop&w=749&q=80',
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withOpacity(.65),
      ),
    );
  }
}
