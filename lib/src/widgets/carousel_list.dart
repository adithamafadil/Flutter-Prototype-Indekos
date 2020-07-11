import 'package:flutter/material.dart';

class CarouselList extends StatefulWidget {
  final double height;
  final double width;
  final Axis scrollDirection;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  CarouselList({
    @required this.height,
    this.width,
    @required this.scrollDirection,
    @required this.itemCount,
    @required this.itemBuilder,
  });

  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height + 140,
      width: widget.width,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: widget.scrollDirection,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
