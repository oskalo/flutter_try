import 'package:flutter/material.dart';

List<Widget> myList = [
  new Text("data"),
  new Divider(),
  new Text("data"),
  new Divider(),
  new Text("data"),
  new Divider(),
  new Text("data"),
  new Divider(),
  new Text("data"),
  new Divider(),
  new Text("data"),
  new Divider(),
  new Text("data"),
  new Divider(),
];

void main() => runApp(
  new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      body: new ListView(children: myList),
    ),
  )
);
