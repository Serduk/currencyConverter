import 'package:flutter/material.dart';

/// Good tutorial for example:
/// https://pusher.com/tutorials/flutter-listviews
/// */

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDialog(context);
        },
      ),
    );
  }

  void _showDialog(BuildContext context) {
    String _value;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select currency'),
            content: DropdownButton(
              items: _fetchCurrency(),
              disabledHint: Text('Select currency'),
              onChanged: (value) {
//                setState();
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _currencyItems(BuildContext context) {
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.attach_money),
              title: Text(_items[index]),
              trailing: Icon(Icons.close),
              onTap: () {
                print(_items[index]);
              },
            ),
          );
        });
  }

  List<DropdownMenuItem<String>> _fetchCurrency() {
    List<DropdownMenuItem<String>> menuItems = List();

    for (String key in _items.keys) {
      menuItems.add(DropdownMenuItem<String>(
        child: Text(_items[key]),
        value: key,
      ));
    }

    return menuItems;
  }

  final _items = {
    '1': 'Dollar',
    '2': 'Hrivna',
    '3': 'Euro',
    '4': 'Bath',
    '5': 'Lirs'
  };
}

class BodyLayout extends StatefulWidget {
  @override
  BodyLayoutState createState() {
    return new BodyLayoutState();
  }
}

class BodyLayoutState extends State<BodyLayout> {
  List<String> titles = ['one', 'two', 'three', 'four'];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return _myListView();
  }

  Widget _myListView() {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        final item = titles[index];
        return Card(
          child: ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                titles.insert(index, 'INPUTET');
              });
            },
            onLongPress: () {
              setState(() {
                titles.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}
