import 'package:flutter/material.dart';

import '../../src/models/carousel_data.dart';
import '../../src/screens/screens.dart';
import '../../src/theme/constant_colors.dart';
import '../../src/models/container_decoration.dart';
import '../../src/widgets/network_image_model.dart';

class Recommendation extends StatefulWidget {
  final CarouselData carouselData;
  final int index;

  Recommendation({this.carouselData, this.index});
  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailscreen(
              carouselData: widget.carouselData,
              index: widget.index,
            ),
          ),
        ),
        child: Hero(
          tag: widget.carouselData.imageUrl,
          child: Container(
            decoration: containerDecoration,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: NetworkImageModel(
                    imageUrl: widget.carouselData.imageUrl,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black26,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.carouselData.name,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(widget.carouselData.rating),
                          SizedBox(height: 24),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 15,
                                color: mainBlack.withOpacity(.5),
                              ),
                              SizedBox(width: 7),
                              Text(
                                widget.carouselData.location,
                                style: TextStyle(
                                  color: mainBlack.withOpacity(.7),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
