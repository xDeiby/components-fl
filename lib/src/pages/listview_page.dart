import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  int _globalCount = 0;
  List<int> _numbers = [];
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _getNewElements();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _getNewElements();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List & Scroll Page'),
        ),
        body: Stack(children: <Widget>[_createList(), _createLoading()]),
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbers.length,
        itemBuilder: (BuildContext context, int index) {
          final num = _numbers[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/500/300?random=$num'));
        },
      ),
    );
  }

  void _getNewElements() {
    for (var i = 0; i < 5; i++) {
      _globalCount++;
      _numbers.add(_globalCount);
    }
    setState(() {});
  }

  Future _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final duration = Duration(seconds: 2);
    return new Timer(duration, _response);
  }

  Future<void> _response() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(microseconds: 200), curve: Curves.fastOutSlowIn);

    _getNewElements();
  }

  _createLoading() {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Container();
  }

  Future<void> _refresh() async {
    final duration = Duration(seconds: 2);
    await new Future.delayed(duration, () {
      _numbers.clear();
      _globalCount++;
      _getNewElements();
    });
  }
}
