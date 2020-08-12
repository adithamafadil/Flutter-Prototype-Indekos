import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
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

  Future getImageStorage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: 'Your Reservation Transaction Has Been Approved!',
      subject: 'Your Reservation Transaction',
      recipients: ['fadil.adithama@gmail.com'],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
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
        actions: <Widget>[
          _reserve[widget.giftIndex]['Status'] != null
              ? IconButton(icon: Icon(Icons.mail), onPressed: () => send())
              : Container()
        ],
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
                            _bloc.clear(
                              widget.giftIndex,
                              _reserve[widget.giftIndex]['Trigger'],
                            );
                            Navigator.pushNamed(context, '/admin');
                          }
                    : () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Center(
                              child: Text(
                                'Upload Foto KTP Penyewa',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                FlatButton(
                                  color: Colors.blueAccent[200],
                                  onPressed: () {
                                    getImage();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Camera'),
                                ),
                                SizedBox(height: 5),
                                FlatButton(
                                  color: Colors.red[200],
                                  onPressed: () {
                                    getImageStorage();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Gallery'),
                                ),
                              ],
                            ),
                          ),
                        );
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
              _reserve[widget.giftIndex]['Trigger'] == 'Monthly'
                  ? widget.carouselData.price
                  : _reserve[widget.giftIndex]['Trigger'] == 'Yearly'
                      ? widget.carouselData.priceYearly
                      : widget.carouselData.priceWeekly,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 12),
            _reserve[widget.giftIndex]['Date'] != null
                ? Text(
                    'Dipesan Untuk Per-${_reserve[widget.giftIndex]['Date']}')
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: CardContainer(
                height: _image != null ? 400 : 300,
                title: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
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
                            : _reserve[widget.giftIndex]['Status'] != null
                                ? Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/58efe4ac-b4fd-4406-a793-daf42bf63e44/d62w8pl-f9147095-e08b-4944-97b7-65e5c884e437.jpg/v1/fill/w_400,h_260,q_75,strp/ktp_indonesia_vector_by_gunardi_d62w8pl-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD0yNjAiLCJwYXRoIjoiXC9mXC81OGVmZTRhYy1iNGZkLTQ0MDYtYTc5My1kYWY0MmJmNjNlNDRcL2Q2Mnc4cGwtZjkxNDcwOTUtZTA4Yi00OTQ0LTk3YjctNjVlNWM4ODRlNDM3LmpwZyIsIndpZHRoIjoiPD00MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.bPSxKntf4OAoN9f8qTgYWvgHtTI6vg5tZYDUJBoPr8o'),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
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
