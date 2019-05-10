import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:currency_converter/CurrencyEntity.dart';

import 'strings.dart' as base;

/// Icons example: https://pub.dartlang.org/packages/currency_icons#-example-tab-
class CurrenciesPage extends StatefulWidget {
  const CurrenciesPage({@required this.title, Key key}) : super(key: key);
  final String title;

  @override
  _CurrencyPage createState() => _CurrencyPage();
}

class _CurrencyPage extends State<CurrenciesPage> {
  Future<CurrencyEntity> future;
  String _url = base.END_POINT;

  void _buildFuture() {
    setState(() {
      future = http
          .get(_url)
          .then((response) => convert.jsonDecode(response.body))
          .then((json) {
        return json;
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
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: FutureBuilder<CurrencyEntity>(
            future: future,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                final _countryCode = snapshot.data.countries.keys.toList();
                final _countryCurrency =
                    snapshot.data.countries.values.toList();

                return ListView.builder(
                  itemCount: _countryCode.length,
                  itemBuilder: (_, i) => CurrencyListTile(
                        country: _countryCode[i],
                        currency: _countryCurrency[i],
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _buildFuture,
          child: const Icon(Icons.refresh),
        ),
      );
}

class CurrencyListTile extends StatelessWidget {
  const CurrencyListTile({Key key, this.country, this.currency})
      : super(key: key);

  final String currency;
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
                '$country',
              ),
            ),
          ),
          title: Text('$country $currency'),
          subtitle: Text(country),
          trailing: Text('$currency'),
        ),
      );
}
