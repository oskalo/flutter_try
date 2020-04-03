import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Main menu")),
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
        }, child: Text("Open second window")),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Second screen")),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text("BACK!"),)),
    );
  }
}

void main() => runApp(
new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new Scaffold(
    appBar: new AppBar(title: new Text("data")),
    body: MainScreen()
  )
)
);
