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
  final Map<String, String> countries;
}

class MyCurrency extends CurrencyEntity {
  MyCurrency.fromJson(Map<String, dynamic> json)
      : super._(
            date: json['date'],
            baseRate: json['base'],
            countries: json['rates']
  );
}
