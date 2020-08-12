import 'package:flutter/cupertino.dart';

class ReserveProvider extends ChangeNotifier {
  Map<dynamic, dynamic> _reserve = {};
  Map<dynamic, dynamic> get reserve => _reserve;

  void addToReserved(index, payment, period, date, trigger) {
    _reserve[index] = 1;
    _reserve[index] = {
      'Payment': payment,
      'PaymentPeriod': period,
      'Date': date,
      'Trigger': trigger,
    };

    notifyListeners();
  }

  void clear(index, trigger) {
    if (_reserve.containsKey(index)) {
      _reserve[index] = {'Status': 'Verified', 'Trigger': trigger};
      notifyListeners();
    }
  }
}
