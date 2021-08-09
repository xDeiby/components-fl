import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _options = [
    'one',
    'two',
    'three',
    'for',
  ];

  List<Widget> _getList() => (_options
      .map<Widget>((e) => Column(
            children: [
              ListTile(
                title: Text(e),
                subtitle: Text('$e subtitle'),
                leading: Icon(Icons.portable_wifi_off_outlined),
                trailing: Icon(Icons.arrow_right),
                onTap: () {},
              ),
              Divider()
            ],
          ))
      .toList());

  @override
  Widget build(BuildContext context) => (Scaffold(
      appBar: AppBar(
        title: Text('Componentes Home'),
      ),
      body: ListView(
        children: _getList(),
      )));
}
