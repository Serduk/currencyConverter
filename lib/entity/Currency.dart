
/// Exchanger API
/// https://exchangeratesapi.io
abstract class CurrencyEntity {
  CurrencyEntity._({
    this.date,
    this.baseRate,
    this.countries,
    this.flag,
  });

  final String date;
  final String baseRate;
  final String flag;
  final Map<String, double> countries;
}

class MyCurrency extends CurrencyEntity {
  MyCurrency.fromJson(Map<String, dynamic> json)
      : super._(
            date: json['date'],
            baseRate: json['base'],
            countries: Map.from(json['rates'])
  );
}
