import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../src/models/carousel_data.dart';
import '../../src/provider/reserve_provider.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = Provider.of<ReserveProvider>(context);
    var _reserve = _bloc.reserve;
    return Scaffold(
      body: ListView.builder(
          itemCount: _reserve.length,
          itemBuilder: (context, index) {
            int giftIndex = _reserve.keys.toList()[index];
            int count = _reserve[giftIndex];
            CarouselData carouselData = carouselDatas[giftIndex];

            return ListTile(
              contentPadding: const EdgeInsets.all(12),
              title: Text(carouselData.name),
              leading: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(carouselData.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
