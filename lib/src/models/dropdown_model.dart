class PaymentModel {
  String payment;

  PaymentModel(this.payment);

  static List<PaymentModel> getPayment() {
    return <PaymentModel>[
      PaymentModel('Ovo'),
      PaymentModel('Gopay'),
      PaymentModel('Cash'),
    ];
  }
}

class PeriodModel {
  String period;

  PeriodModel(this.period);

  static List<PeriodModel> getPeriod() {
    return <PeriodModel>[
      PeriodModel('Once a Year'),
      PeriodModel('Once a Month'),
      PeriodModel('Once a Week'),
    ];
  }
}
