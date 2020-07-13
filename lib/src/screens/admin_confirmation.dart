import 'package:flutter/material.dart';
import 'package:indekosapp/src/models/carousel_data.dart';

class AdminCorfirmation extends StatelessWidget {
  final CarouselData carouselData;
  AdminCorfirmation({this.carouselData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * .37,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(carouselData.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
