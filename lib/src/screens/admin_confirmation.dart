import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../src/models/carousel_data.dart';
import '../../src/provider/reserve_provider.dart';

class AdminCorfirmation extends StatelessWidget {
  final CarouselData carouselData;
  final int giftIndex;
  AdminCorfirmation({this.carouselData, this.giftIndex});

  @override
  Widget build(BuildContext context) {
    var _bloc = Provider.of<ReserveProvider>(context);
    var _reserve = _bloc.reserve;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: _reserve[giftIndex]['Status'] != null
                ? Colors.red
                : Colors.green[300],
            onPressed: _reserve[giftIndex]['Status'] != null
                ? null
                : () {
                    _bloc.clear(giftIndex);
                    Navigator.pop(context);
                  },
            child: Text(
              _reserve[giftIndex]['Status'] != null ? 'Verified' : 'Verificate',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .37,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(carouselData.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            carouselData.name,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            '${carouselData.price}/${_reserve[giftIndex]['PaymentPeriod']}',
            style: Theme.of(context).textTheme.headline4,
          ),
          _reserve[giftIndex]['Status'] != null
              ? Text('${_reserve[giftIndex]['Status']}')
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('${_reserve[giftIndex]['Payment']}'),
                    Text('${_reserve[giftIndex]['PaymentPeriod']}'),
                  ],
                ),
        ],
      ),
    );
  }
}
