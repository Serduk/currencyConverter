import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:currency_converter/CurrencyEntity.dart';
import 'package:currency_converter/AvailableCurrencies.dart';

/// Icons example: https://pub.dartlang.org/packages/currency_icons#-example-tab-
class CurrenciesPage extends StatefulWidget {
  const CurrenciesPage({@required this.title, Key key}) : super(key: key);
  final String title;

  @override
  _CurrencyPage createState() => _CurrencyPage();
}

class _CurrencyPage extends State<CurrenciesPage> {
  Future<List<CurrencyEntity>> future;

  String _url = "https://api.exchangeratesapi.io/latest";

  void _buildFuture() {
    setState(() {
      future = http
          .get(_url)
          .then((response) => convert.jsonDecode(response.body))
          .then((json) {
        final List results = json['rates'];
        return results.map((m) => MyCurrency.fromJson(m)).toList();
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
          child: FutureBuilder<List<CurrencyEntity>>(
            future: future,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                final currencies = snapshot.data;
                return ListView.builder(
                  itemCount: currencies.length,
                  itemBuilder: (_, i) =>
                      CurrencyListTile(currency: currencies[i]),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(
                child: const Text('Loading...'),
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
  const CurrencyListTile({Key key, this.currency}) : super(key: key);

  final CurrencyEntity currency;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('CURRENCY: ${currency.name}'),
            ),
          );
        },
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      content: Image.asset(
                          'icons/currency/${this.currency.name}.png',
                          package: 'currency_icons'),
                    ),
              );
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                '${currency.flag}',
              ),
            ),
          ),
          title: Text('${currency.name} ${currency.date}'),
          subtitle: Text(currency.flag),
          trailing: Text(currency.name),
        ),
      );
}
