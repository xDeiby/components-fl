import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 200.0;
  bool _lockSlider = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Slider Page'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              _createSlider(),
              _createCheckbox(),
              _createSwitch(),
              Expanded(child: _createImg())
            ],
          ),
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      // divisions: 4,
      label: 'Tamaño de imagen',
      activeColor: Colors.pink,
      min: 0.0,
      max: 400.0,
      value: _sliderValue,
      onChanged: _lockSlider
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _createImg() => Image(
        image: NetworkImage(
            'https://www.neappoli.com/static/media/flutterImg.94b8139a.png'),
        width: _sliderValue,
        fit: BoxFit.contain,
      );

  Widget _createCheckbox() => (
      // Checkbox(
      //   value: _lockSlider,
      //   onChanged: (value) {
      //     setState(() {
      //       _lockSlider = value;
      //     });
      //   }));
      CheckboxListTile(
          value: _lockSlider,
          title: Text('Desabilitar'),
          onChanged: (value) {
            setState(() {
              _lockSlider = value;
            });
          }));

  Widget _createSwitch() {
    return SwitchListTile(
        value: _lockSlider,
        title: Text('Desabilitar'),
        onChanged: (value) {
          setState(() {
            _lockSlider = value;
          });
        });
  }
}
