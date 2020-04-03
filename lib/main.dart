import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Less or more")),
      body: Center(
        child: Column(children: <Widget>[
          RaisedButton(onPressed: () async {
            bool value = await Navigator.push(context, PageRouteBuilder(
              opaque: false, pageBuilder: (context, _, __) => MyPopup(),
              transitionsBuilder: (___, animation, ____, child) {
               return FadeTransition(
                   opacity: animation,
                 child: ScaleTransition(scale: animation, child: child),
               );
            })
            );

            if (value) _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("More"), backgroundColor: Colors.green));
            else _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Less'), backgroundColor: Colors.red,));
          }, child: Text("Find counter")),
        ])
      ),
    );
  }
}

class MyPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title: Text('Your answer'),
      actions: <Widget>[
        FlatButton(
          onPressed: (){Navigator.pop(context, true);},
          child: Text('more'),
        ),
        FlatButton(
          onPressed: (){Navigator.pop(context, false);},
          child: Text('less'),
        )
      ],
    );
  }
}

void main() => runApp(
new MaterialApp(
  home: MainScreen(),
)
);
