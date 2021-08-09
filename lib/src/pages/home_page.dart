import 'package:firstproject/src/providers/menu_provider.dart';
import 'package:firstproject/src/utils/icon_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    // menuProvider.loadData().then((value) => print(value));
    // return ListView(
    //   children: _getItems(),
    // );

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    return data
        .map<Widget>((item) => Column(
              children: [
                ListTile(
                  title: Text(item['text']),
                  trailing: Icon(Icons.arrow_right),
                  leading: getIcon(nameIcon: item['icon']),
                  onTap: () {
                    // final route =
                    //     MaterialPageRoute(builder: (context) => AlertPage());
                    // Navigator.push(context, route);
                    Navigator.pushNamed(context, item['route']);
                  },
                  // leading: Icon[],
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
