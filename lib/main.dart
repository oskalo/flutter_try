import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Main menu")),
      body: Center(
        child: Column(children: <Widget>[
          RaisedButton(onPressed: (){
            Navigator.pushNamed(context, '/second');
          }, child: Text("Open second window")),
          RaisedButton(onPressed: (){
            Navigator.pushNamed(context, '/second/123');
          }, child: Text("Open second window")),
        ])
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String _id;

  SecondScreen({String id}): _id = id;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Second screen $_id")),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text("BACK!"),)),
    );
  }
}

void main() => runApp(
new MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/':(BuildContext context) => MainScreen(),
    '/second': (BuildContext context) => SecondScreen(),
  },
  // ignore: missing_return
  onGenerateRoute: (routeSettings){
    var path = routeSettings.name.split("/");

    if (path[1] == "second") {
      return new MaterialPageRoute(builder: (builder) => new SecondScreen(id: path[2]),
      settings: routeSettings);
    }
  },
)
);
