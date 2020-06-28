import 'package:flutter/cupertino.dart';

class CarouselData {
  final String url;
  final String name;
  final String rating;
  final String location;

  CarouselData({
    @required this.name,
    @required this.location,
    @required this.rating,
    @required this.url,
  })  : assert(name != null),
        assert(location != null),
        assert(rating != null),
        assert(url != null);
}

List<CarouselData> carouselDatas = [
  CarouselData(
    name: 'Kos Kampus 1',
    location: 'Jakarta',
    rating: '⭐⭐⭐⭐',
    url:
        'https://images.unsplash.com/photo-1565330502541-4937be8552e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
  ),
  CarouselData(
    name: 'Kos Kampus 2',
    location: 'Bandung',
    rating: '⭐⭐⭐⭐',
    url:
        'https://images.unsplash.com/photo-1564078516393-cf04bd966897?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
  ),
  CarouselData(
    name: 'Apartemen Kampus 1',
    location: 'Surabaya',
    rating: '⭐⭐⭐⭐',
    url:
        'https://images.unsplash.com/photo-1524061511843-fd43443e3cb2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80',
  ),
  CarouselData(
    name: 'Apartemen Kantor 1',
    location: 'Semarang',
    rating: '⭐⭐⭐⭐',
    url:
        'https://images.unsplash.com/photo-1486946255434-2466348c2166?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
  ),
  CarouselData(
    name: 'Kontrakan',
    location: 'Yogyakarta',
    rating: '⭐⭐⭐⭐',
    url:
        'https://images.unsplash.com/photo-1537200086021-dd85d29e229f?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
  ),
];
