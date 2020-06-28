import 'package:flutter/material.dart';
import '../../src/theme/constant_colors.dart';
import '../../src/models/container_decoration.dart';
import '../../src/models/carousel_data.dart';

class CarouselList extends StatefulWidget {
  final double height;
  final double containerWidth;
  final Axis scrollDirection;

  CarouselList({
    @required this.height,
    @required this.containerWidth,
    @required this.scrollDirection,
  });

  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height + 130,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: widget.scrollDirection,
        itemCount: carouselDatas.length,
        itemBuilder: (context, index) {
          CarouselData _carouselData = carouselDatas[index];
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: containerDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: widget.containerWidth,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(_carouselData.url),
                        fit: BoxFit.fitWidth,
                        colorFilter: ColorFilter.mode(
                          Colors.black26,
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _carouselData.name,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(_carouselData.rating),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 12),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 15,
                          color: mainBlack.withOpacity(.5),
                        ),
                        SizedBox(width: 7),
                        Text(
                          _carouselData.location,
                          style: TextStyle(
                            color: mainBlack.withOpacity(.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
