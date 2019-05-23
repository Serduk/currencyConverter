import 'dart:convert' as convert;

import 'package:currency_converter/currency_screen/currency_model.dart';
import 'package:currency_converter/currency_screen/currency_presenter.dart';
import 'package:currency_converter/entity/Country.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:currency_converter/entity/Currency.dart';

import 'package:currency_converter/strings.dart' as base;

/// Icons example: https://pub.dartlang.org/packages/currency_icons#-example-tab-
/// TODO: Use hero for open any data: https://api.flutter.dev/flutter/widgets/Hero-class.html
class CurrenciesPage extends StatefulWidget {
  final presenter = CurrencyPresenter(CurrencyModel());

  @override
  _CurrencyPage createState() => _CurrencyPage();
}

class _CurrencyPage extends State<CurrenciesPage>
    with SingleTickerProviderStateMixin
    implements CurrencyView {
  Future<CurrencyEntity> future;
  Future<Country> fCountries;
  double _exchange;

  void _buildFuture() {
    setState(() {
      future = http
          .get(base.epCurrencyExchanger)
          .then((response) => convert.jsonDecode(response.body))
          .then((json) {
        return MyCurrency.fromJson(json);
      });

      fCountries = http
          .get(base.epCountries)
          .then((response) => convert.jsonDecode(response.body))
          .then((json) {
        return MyCountry.fromJson(json);
      });
    });
  }

  @override
  void initState() {
    _buildFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(base.currency_title),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: futureBuild(),
                  flex: 1,
                ),
                Flexible(
                  child: inputForm(),
                  flex: 0,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _buildFuture,
          child: const Icon(Icons.refresh),
        ),
      );

  Widget futureBuild() {
    return Container(
      child: FutureBuilder<CurrencyEntity>(
        future: future,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final _countryCode = snapshot.data.countries.keys.toList();
            final _countryCurrency = snapshot.data.countries.values.toList();

            if (_exchange == null) _exchange = 1.0;
            return ListView.builder(
              itemCount: _countryCode.length,
              itemBuilder: (_, i) => CurrencyListTile(
                    country: _countryCode[i],
                    currency: _countryCurrency[i],
                    exchange: _exchange,
                  ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: Text('${base.loading}'),
          );
        },
      ),
    );
  }

  Widget inputForm() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: base.moneyCount,
            prefixIcon: IconButton(
              icon: Icon(Icons.euro_symbol),
              onPressed: () {
//                TODO: Not implemented yet
              },
            ),
            suffixIcon: IconButton(
                icon: Icon(Icons.monetization_on),
                onPressed: () {
//        TODO: Recalculate
                })),
        keyboardType: TextInputType.number,
        autovalidate: true,
        validator: (value) {
          _exchange = double.tryParse(value);
          if (value == null) return;
          futureBuild();
        },
      ),
    );
  }

  @override
  void calculateCurrency() {
    // TODO: implement calculateCurrency
  }

  @override
  void displayCurrencyList() {
    // TODO: implement displayCurrencyList
  }

  @override
  void recalculateCurrencies() {
    // TODO: implement recalculateCurrencies
  }

  @override
  void refreshCurrency() {
    // TODO: implement refreshCurrency
  }

  @override
  void showCountryDetails() {
    // TODO: implement showCountryDetails
  }

  @override
  void navigateToLogin() {
    // TODO: implement navigateToLogin
  }
}

class CurrencyListTile extends StatelessWidget {
  const CurrencyListTile({Key key, this.country, this.currency, this.exchange})
      : super(key: key);

  final double currency;
  final double exchange;
  final String country;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CURRENCY: $currency'),
            ),
          );
        },
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      content: Image.asset('icons/currency/$currency.png',
                          package: 'currency_icons'),
                    ),
              );
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://restcountries.eu/data/$country.svg',
              ),
            ),
          ),
          title: Text('$country $currency'),
          subtitle: Text(country),
          trailing: Text('${(currency * exchange).toStringAsFixed(2)}'),
        ),
      );
}
