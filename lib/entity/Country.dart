abstract class Country {
  Country._({
    this.name,
    this.nativeName,
    this.capital,
    this.region,
    this.timeZone,
    this.flag,
    this.alpha3Code,
    this.currencyName,
    this.currencySymbol,
});

  final String name;
  final String nativeName;
  final String capital;
  final String region;
  final String timeZone;
  final String flag;
  final String alpha3Code;
  final String currencyName;
  final String currencySymbol;
}

class MyCountry extends Country {
  MyCountry.fromJson(Map<String, dynamic> json) : super._(
    name: json[''],
    nativeName: json[''],
    capital: json[''],
    region: json[''],
    timeZone: json[''],
    flag: json[''],
    alpha3Code: json[''],
    currencyName: json[''],
    currencySymbol: json[''],
  );
}