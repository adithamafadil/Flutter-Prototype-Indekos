import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../src/widgets/home_clipper.dart';
import '../../src/widgets/search_bar.dart';
import '../../src/widgets/carousel_list.dart';
import '../../src/widgets/card_container.dart';
import '../../src/widgets/homestay_type.dart';
import '../../src/models/carousel_data.dart';
import '../../src/models/recommendation.dart';
import '../../src/screens/screens.dart';
import '../../src/widgets/carousel_promo.dart';

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
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/account'),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80',
                        ),
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
                  padding: const EdgeInsets.only(left: 24, bottom: 12),
                  child: Text(
                    'Promotions',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                CarouselPromo(),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: CardContainer(
                    height: 200,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8),
                        Text(
                          'Homestay Type',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 28),
                        Row(
                          children: <Widget>[
                            HomestayType(
                              desc: 'Kosan',
                              imagePath: 'assets/images/house.svg',
                              onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => ListSearchKosanScreen(),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            HomestayType(
                              desc: 'Kontrakan',
                              imagePath: 'assets/images/property.svg',
                              onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      ListSearchKontrakanScreen(),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            HomestayType(
                              desc: 'Apartemen',
                              imagePath: 'assets/images/apartment.svg',
                              onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      ListSearchApartmentScreen(),
                                ),
                              ),
                            ),
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
                  height: 110,
                  scrollDirection: Axis.horizontal,
                  itemCount: carouselDatas.length,
                  itemBuilder: (context, index) {
                    CarouselData _carouselData = carouselDatas[index];
                    return Recommendation(
                      carouselData: _carouselData,
                      index: index,
                    );
                  },
                ),
                SizedBox(height: 24),
              ],
            )
          ],
        ),
      ),
    );
  }
}
