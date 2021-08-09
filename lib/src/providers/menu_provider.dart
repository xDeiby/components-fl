import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    loadData();
  }

  Future<List<dynamic>> loadData() async {
    final result = await rootBundle.loadString('data/menu_opts.json');

    Map data = json.decode(result);

    options = data['routes'];

    return options;
  }
}

final menuProvider = new _MenuProvider();
