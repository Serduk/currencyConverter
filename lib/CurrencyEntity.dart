abstract class CurrencyEntity {
  CurrencyEntity._({
    this.name,
    this.date,
    this.rateToStandard,
    this.flag,
  });

  final String name;
  final String date;
  final String rateToStandard;
  final String flag;
}

class MyCurrency extends CurrencyEntity {
  MyCurrency.fromJson(Map<String, dynamic> json)
      : super._(
//            name: json['base'],
//            date: json['date'],
//            rateToStandard: json['rates']['cRateToStandard'],
//            flag: json['flag']['cFlag']);

            name: 'NAME',
            date: 'DATE',
            rateToStandard: json['rates']['RUB'],
            flag: 'FLAG');
}
