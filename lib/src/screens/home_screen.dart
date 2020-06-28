import 'package:flutter/material.dart';

import '../../src/widgets/home_clipper.dart';
import '../../src/widgets/search_bar.dart';
import '../../src/widgets/carousel_list.dart';
import '../../src/widgets/card_container.dart';
import '../../src/widgets/homestay_type.dart';
import '../../src/theme/constant_colors.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            HomeClipper(queryHeight: .365),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Welcome, User',
                      style: TextStyle(color: Colors.white),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * .17),
                Padding(
                  padding: const EdgeInsets.only(left: 48),
                  child: RichText(
                    text: TextSpan(
                      text: 'Let\'s Find Your',
                      style: Theme.of(context).textTheme.headline2,
                      children: [
                        TextSpan(
                          text: '\nHomestay Here',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 48),
                SearchBar(),
                SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: CardContainer(
                    title: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.home, color: mainBlack),
                            SizedBox(width: 7),
                            Text(
                              'Homestay Type',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                        SizedBox(height: 28),
                        Row(
                          children: <Widget>[
                            HomestayType(),
                            SizedBox(width: 12.0),
                            HomestayType(),
                            SizedBox(width: 12.0),
                            HomestayType(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Recommendation',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                CarouselList(
                  containerWidth: 200,
                  height: 120,
                  scrollDirection: Axis.horizontal,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
