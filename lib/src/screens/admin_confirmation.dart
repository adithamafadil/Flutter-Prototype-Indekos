import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../src/models/carousel_data.dart';
import '../../src/provider/reserve_provider.dart';
import '../../src/widgets/card_container.dart';

class AdminCorfirmation extends StatefulWidget {
  final CarouselData carouselData;
  final int giftIndex;
  AdminCorfirmation({this.carouselData, this.giftIndex});

  @override
  _AdminCorfirmationState createState() => _AdminCorfirmationState();
}

class _AdminCorfirmationState extends State<AdminCorfirmation> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

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
            color: _reserve[widget.giftIndex]['Status'] != null
                ? Colors.red
                : Colors.green[300],
            onPressed:
                _image != null || _reserve[widget.giftIndex]['Status'] != null
                    ? _reserve[widget.giftIndex]['Status'] != null
                        ? null
                        : () {
                            _bloc.clear(widget.giftIndex, _image);
                            Navigator.pushNamed(context, '/admin');
                          }
                    : () {
                        getImage();
                      },
            child: Text(
              _reserve[widget.giftIndex]['Status'] != null
                  ? 'Verified'
                  : 'Verificate',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .37,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.carouselData.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              widget.carouselData.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '${widget.carouselData.price}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: CardContainer(
                height: _image != null ? 400 : 220,
                title: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Reserved by',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 28),
                      Container(
                        child: _image != null
                            ? Image.file(_image)
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80',
                                    ),
                                    radius: 24,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'ST. Rogers',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(height: 24),
                      _reserve[widget.giftIndex]['Status'] != null
                          ? Text(
                              'Payment ${_reserve[widget.giftIndex]['Status']}',
                              style: Theme.of(context).textTheme.headline3,
                            )
                          : Column(
                              children: <Widget>[
                                Text('Payment Detail'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      '${_reserve[widget.giftIndex]['Payment']}',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Text(
                                      '${_reserve[widget.giftIndex]['PaymentPeriod']}',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
