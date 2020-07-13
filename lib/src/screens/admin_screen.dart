import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indekosapp/src/screens/admin_confirmation.dart';
import 'package:provider/provider.dart';

import '../../src/models/carousel_data.dart';
import '../../src/provider/reserve_provider.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = Provider.of<ReserveProvider>(context);
    var _reserve = _bloc.reserve;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Someone Want To Reserve',
          style: Theme.of(context).textTheme.headline4,
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            child: Text(
              'Log out',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: _reserve.length == 0
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Data Penyewaat Saat Ini Kosong!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          : ListView.builder(
              itemCount: _reserve.length,
              itemBuilder: (context, index) {
                int giftIndex = _reserve.keys.toList()[index];
                CarouselData carouselData = carouselDatas[giftIndex];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AdminCorfirmation(
                          carouselData: carouselData,
                        ),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      title: Text(carouselData.name),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('${_reserve[giftIndex]['Payment']}'),
                          Text('${_reserve[giftIndex]['PaymentPeriod']}'),
                        ],
                      ),
                      leading: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: NetworkImage(carouselData.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
