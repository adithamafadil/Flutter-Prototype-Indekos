import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indekosapp/src/provider/reserve_provider.dart';
import 'package:provider/provider.dart';

import '../../src/models/carousel_data.dart';
import '../../src/theme/constant_colors.dart';
import '../../src/theme/foreground_image.dart';
import '../../src/widgets/card_container.dart';
import '../../src/widgets/carousel_list.dart';
import '../../src/screens/screens.dart';
import '../../src/models/container_decoration.dart';
import '../../src/models/custom_icons.dart';
import '../../src/widgets/custom_button.dart';
import '../../src/widgets/network_image_model.dart';

class Detailscreen extends StatefulWidget {
  final CarouselData carouselData;
  final int index;

  Detailscreen({@required this.carouselData, this.index});

  @override
  _DetailscreenState createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    var _bloc = Provider.of<ReserveProvider>(context);
    var _reserve = _bloc.reserve;
    int _roomLeft;

    setState(() {
      print(_reserve.containsKey(widget.index).toString());
      _roomLeft = 100;
      _reserve.containsKey(widget.index) ? _roomLeft -= 1 : _roomLeft;
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: backgroundWhite,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.carouselData.price,
                style: Theme.of(context).textTheme.headline5,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.green[300],
                onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Paymentscreen(
                      carouselData: widget.carouselData,
                      index: widget.index,
                    ),
                  ),
                ),
                child: Text(
                  'Reserve Now',
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            ],
          ),
        ),
      ),
      body: Hero(
        tag: widget.carouselData.imageUrl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
                foregroundDecoration: foregroundDecoration(.45),
                child: NetworkImageModel(
                  imageUrl: widget.carouselData.imageUrl,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .13,
                child: CarouselList(
                  height: MediaQuery.of(context).size.height * .13,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.carouselData.imageUrl),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        foregroundDecoration: foregroundDecoration(.7),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: <Widget>[
                    Text('$_roomLeft'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.carouselData.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Icon(Icons.location_on,
                                color: mainBlack.withOpacity(.65), size: 14),
                            SizedBox(width: 7),
                            Text(
                              widget.carouselData.location,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(widget.carouselData.rating,
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 75,
                        width: 90,
                        decoration: containerDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 17),
                              child: Icon(
                                Facilities.air_conditioner,
                                size: 30,
                                color: Colors.indigo,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('AC')
                          ],
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 90,
                        decoration: containerDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Facilities.bathtub,
                              size: 30,
                              color: Colors.lightBlueAccent[700],
                            ),
                            SizedBox(height: 5),
                            Text('Inner Bath')
                          ],
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 90,
                        decoration: containerDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Facilities.wireless_router,
                              size: 30,
                              color: Colors.red[600],
                            ),
                            SizedBox(height: 5),
                            Text('WiFi')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CardContainer(
                  height: 250,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 7,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Owner',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 28),
                        Container(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80',
                                ),
                                radius: 24,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Robert D. Junior',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomButton(
                              icon: Icon(
                                Icons.chat,
                                color: Colors.green[300],
                              ),
                              text: 'Chat Me!',
                            ),
                            SizedBox(width: 12),
                            CustomButton(
                              icon: Icon(
                                Icons.mail,
                                color: Colors.redAccent,
                              ),
                              text: 'Mail Me!',
                            ),
                          ],
                        ),
                        CustomButton(
                          icon: Icon(
                            Icons.language,
                            color: Colors.blueAccent[700],
                          ),
                          text: 'Visit Our Website!',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
