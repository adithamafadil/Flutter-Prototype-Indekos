import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/carousel_data.dart';
import '../models/searched_list_model.dart';
import '../widgets/carousel_list.dart';
import '../theme/constant_colors.dart';

class ListSearchApartmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 80),
            child: CarouselList(
              height: 110,
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (context, index) {
                CarouselData _carouselData = carouselDatas[index + 2];
                return SearchedListModel(
                  carouselData: _carouselData,
                  index: index,
                );
              },
            ),
          ),
          Container(
            height: 90,
            decoration: BoxDecoration(color: backgroundWhite, boxShadow: [
              BoxShadow(
                color: Color(0xFF989898).withOpacity(.5),
                offset: Offset(5, 7),
                blurRadius: 7,
              )
            ]),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Search for Kosan',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
