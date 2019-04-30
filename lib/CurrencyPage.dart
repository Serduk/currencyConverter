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
                    final curencyes = snapshot.data;
                    return ListView.builder(
                      itemCount: curencyes.length,
                      itemBuilder: (_, i) =>
                          CurrencyListTile(currency: curencyes[i]),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(
                    child: const Text('Loading...'),
                  );
                })),
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
              content: Text('Currenc: ${currency.rateToStandard}'),
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
                      ));
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'icons/currency/${this.currency.name}.png',
              ),
            ),
          ),
          title: Text(
              '${currency.name} ${currency.rateToStandard}, ${currency.date}'),
          subtitle: Text('DATE: ${currency.date}'),
          trailing: Text("CURRENCY NAME: ${currency.name}"),
        ),
      );
}
