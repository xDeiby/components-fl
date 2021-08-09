import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContent extends StatefulWidget {
  @override
  _AnimatedContentState createState() => _AnimatedContentState();
}

class _AnimatedContentState extends State<AnimatedContent> {
  double _height = 50.0;
  double _width = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Content'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_outlined),
        onPressed: _changeBox,
      ),
    );
  }

  void _changeBox() {
    Random random = new Random();

    setState(() {
      _height = random.nextInt(300).toDouble();
      _width = random.nextInt(300).toDouble();
      _color = Color.fromARGB(random.nextInt(255), random.nextInt(255),
          random.nextInt(255), random.nextInt(255));
      _borderRadius = BorderRadius.circular(random.nextInt(50).toDouble());
    });
  }
}
