import 'package:flutter/material.dart';

import '../../src/models/carousel_data.dart';
import '../../src/screens/screens.dart';
import '../../src/theme/constant_colors.dart';
import '../../src/models/container_decoration.dart';
import '../../src/widgets/network_image_model.dart';

class SearchedListModel extends StatefulWidget {
  final CarouselData carouselData;
  final int index;
  SearchedListModel({this.carouselData, this.index});
  @override
  _SearchedListModelState createState() => _SearchedListModelState();
}

class _SearchedListModelState extends State<SearchedListModel> {
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
                  width: 170,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(15),
                    ),
                  ),
                  child: NetworkImageModel(
                    imageUrl: widget.carouselData.imageUrl,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black26,
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    padding: const EdgeInsets.only(left: 170, top: 12),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
