import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: () {
            _showAlert(context: context);
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: StadiumBorder(),
              textStyle: TextStyle(
                fontSize: 17.0,
                // color: Colors.red
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert({@required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,      
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        title: Text('Titulo alerta'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Contenido de la alerta'),
            FlutterLogo(size: 100.0,)
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('CANCEL'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      )
    );
  }
}
