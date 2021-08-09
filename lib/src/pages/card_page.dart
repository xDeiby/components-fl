import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cards Page'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardType1(),
            SizedBox(height: 20.0,),
            _cardType2(),
                        _cardType1(),
            SizedBox(height: 20.0,),
            _cardType2(),
                        _cardType1(),
            SizedBox(height: 20.0,),
            _cardType2(),
                        _cardType1(),
            SizedBox(height: 20.0,),
            _cardType2(),
                        _cardType1(),
            SizedBox(height: 20.0,),
            _cardType2(),
            
          ],
        ),
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Titulo tarjeta'),
            subtitle: Text('aaaaaaaaaad asd sa d as das da sd as dasd asdsdsd asd sadsdsad sa dsd sd as ds'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('CANCEL'),
                onPressed: (){}
              ),
              TextButton(
                child: Text('OK'),
                onPressed: (){}
              ),            
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    return Card(
      elevation: 10.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://i.pinimg.com/originals/ea/00/0c/ea000cc6fb9375b14a7b21d55dcf9745.jpg'),
            height: 300.0,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 200),
          ),
          // Image(image: NetworkImage('https://static.vecteezy.com/system/resources/previews/000/246/312/original/mountain-lake-sunset-landscape-first-person-view-vector.jpg')),
          Container(
            child: Text('Descripcion de la imagen adjunta'),
            padding: EdgeInsets.all(20.0),
          )
        ],
      ),
    );
  }
}
