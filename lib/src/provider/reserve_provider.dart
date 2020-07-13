import 'package:flutter/cupertino.dart';

class ReserveProvider extends ChangeNotifier {
  Map<int, int> _reserve = {};
  Map<int, int> get reserve => _reserve;

  void addToReserved(index) {
    if (_reserve.containsKey(index)) {
      _reserve[index] += 1;
    } else {
      _reserve[index] = 1;
    }
    notifyListeners();
  }
}
