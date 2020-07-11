import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../src/theme/constant_colors.dart';
import '../../src/models/carousel_data.dart';

class Confirmedscreen extends StatefulWidget {
  final CarouselData carouselData;
  Confirmedscreen({this.carouselData});
  @override
  _ConfirmedscreenState createState() => _ConfirmedscreenState();
}

class _ConfirmedscreenState extends State<Confirmedscreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'proces',
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Text('Back To Home'),
            ),
          ),
        ),
        body: Container(
          color: Colors.green,
          height: double.infinity,
          width: double.infinity,
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    left: 36,
                    right: 36,
                    bottom: 60,
                    top: 192,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: backgroundWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF989898).withOpacity(.5),
                        offset: Offset(5, 7),
                        blurRadius: 7,
                      )
                    ],
                  ),
                  child: _loading == true
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 12),
                            Text(
                              'TRANSACTION SUCCESS!',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 24),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          widget.carouselData.imageUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.carouselData.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      Text(
                                        widget.carouselData.location,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 24),
                            Text(
                              widget.carouselData.price,
                              style: Theme.of(context).textTheme.headline5,
                            )
                          ],
                        ),
                ),
                Lottie.asset(
                  'assets/animations/house.json',
                  repeat: false,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
