import 'package:flutter/material.dart';

class NewsBoxFavourit extends StatefulWidget{
  final int _num;
  final bool _like;

  NewsBoxFavourit(this._num, this._like);

  @override
  createState() => new NewsBoxFavouritState(_num, _like);
}

class NewsBoxFavouritState extends State<NewsBoxFavourit> {
  int num = 1;
  bool like = false;

  NewsBoxFavouritState(this.num, this.like);

  void pressButton(){
    setState(() {
      like = !like;

      if (like) num++;
      else num--;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Column(children: <Widget>[
      new Text("In favourit \n$num", textAlign: TextAlign.center),
      new IconButton(
          icon: new Icon(like? Icons.star : Icons.star_border, size: 30.0),
          onPressed: pressButton,
          color: Colors.blue[500]
      )
    ],);
  }
}



class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageUrl;

  int _num;
  bool _like;

  NewsBox(this._title, this._text, {String img, int num = 0, bool like = false}){
    _imageUrl = img;
    _num = num;
    _like = like;
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 100.0,
      child: new Row(children: <Widget>[
        new Image.network( _imageUrl, width: 100.0, height: 100.0, fit: BoxFit.cover),
        new Expanded (child: new Container(child: new Column(children: <Widget>[
          new Text(_title, style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
          new Expanded(child: new Text(_text, softWrap: true, textAlign: TextAlign.justify)),
          new NewsBoxFavourit(_num, _like)
        ])))
      ],
      ),
    );
  }
}

void main() {
  runApp(
      new MaterialApp(
          debugShowCheckedModeBanner:false,
          home:new Scaffold(
            appBar: new AppBar(),
            body: new NewsBox("Lesson 2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed vestibulum sem.",
                img: "https://interactive-examples.mdn.mozilla.net/media/examples/grapefruit-slice-332-332.jpg",
                like: true,
                num: 101)
          )
      )
  );
}