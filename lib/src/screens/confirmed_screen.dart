import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../src/theme/constant_colors.dart';
import '../../src/models/carousel_data.dart';
import '../../src/models/dropdown_model.dart';
import '../../src/models/container_decoration.dart';
import '../../src/screens/screens.dart';

class Confirmedscreen extends StatefulWidget {
  final CarouselData carouselData;
  final PaymentModel selectedPayment;
  final PeriodModel selectedPeriod;

  Confirmedscreen({
    this.carouselData,
    this.selectedPayment,
    this.selectedPeriod,
  });
  @override
  _ConfirmedscreenState createState() => _ConfirmedscreenState();
}

class _ConfirmedscreenState extends State<Confirmedscreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 3300), () {
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
              onPressed: () => Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => Homescreen()),
              ),
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
                    bottom: 36,
                    top: 192,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: backgroundWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
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
                              widget.selectedPayment.payment == 'Transfer (BCA)'
                                  ? 'PLEASE TRANSFER TO 098-7654-321'
                                  : 'TRANSACTION SUCCESS!',
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
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  decoration: containerDecoration,
                                  child: Text(widget.selectedPayment.payment),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  decoration: containerDecoration,
                                  child: Text(widget.selectedPeriod.period),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Lottie.asset(
                    'assets/animations/house.json',
                    repeat: false,
                    height: 210,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
