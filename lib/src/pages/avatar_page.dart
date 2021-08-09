import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage('https://as.com/meristation/imagenes/2021/01/20/noticias/1611162270_013847_1611162672_noticia_normal.jpg'),
          ),          
          Container(
            margin: EdgeInsets.only(right: 10.0, left: 10.0),
            child: CircleAvatar(
              child:  Text('DC'),
              backgroundColor: Colors.pink,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://images6.alphacoders.com/908/thumb-1920-908024.png'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}