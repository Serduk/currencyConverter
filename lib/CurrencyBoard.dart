import 'package:flutter/material.dart';

class CurrencyBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Board'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go Back'),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
