
/// Country Details
/// https://restcountries.eu/#filter-response
/// https://restcountries.eu/rest/v2/all
abstract class Country {
  Country._({
    this.name,
    this.nativeName,
    this.capital,
    this.region,
    this.timeZones,
    this.population,
    this.translations,
    this.flag,
    this.alpha3Code,
    this.currencyName,
    this.currencyCode,
    this.currencySymbol,
});

  final String name;
  final String nativeName;
  final String capital;
  final String region;
  final List<String> timeZones;
  final Map<String, String> translations;
  final String population;
  final String flag;
  final String alpha3Code;
  final String currencyCode;
  final String currencyName;
  final String currencySymbol;
}

class MyCountry extends Country {
  MyCountry.fromJson(Map<String, dynamic> json) : super._(
    name: json['name'],
    nativeName: json['nativeName'],
    capital: json['capital'],
    region: json['region'],
    population: json['population'],
//    timeZones: json['timezones'],
    timeZones: List.from(json['timezones']),
    translations: Map.from(json['translations']),
    flag: json['flag'],
    alpha3Code: json['alpha3Code'],
    currencyName: json['currencies']['name'],
    currencySymbol: json['currencies']['symbol'],
    currencyCode: json['currencies']['code'],
  );
}