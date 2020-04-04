import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
new MaterialApp(
  home: Scaffold(body: TestHttp()),
)
);

class TestHttp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestHttpState();
}

class TestHttpState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lesson of hhtp requests')),
      body: Center(child: FlatButton(onPressed: (){
        http.get('https://json.flutter.su/echo').then((responce){
          print("Response status: ${responce.statusCode}");
          print("Response body: ${responce.body}");
        }).catchError((error) {
          print("Error: $error");
        }
        );

      }, child: Text("HTTP"))),
    );
  }
}