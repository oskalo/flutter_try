import 'package:flutter/material.dart';


void main() => runApp(
new MaterialApp(
  home: Scaffold(body: MyApp()),
)
);

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State {
  SandGlass clock = SandGlass();

  @override
  void initState () {
    super.initState();

    clock.tick();
  }

  _reDrawWidget()async{
    if (clock.time() == 0) return;
    await new Future.delayed(Duration(seconds: 1));
    setState(() {
    print('_reDrawWidget()');
  });
  }

  @override
  Widget build(BuildContext context) {
    _reDrawWidget();
    return Center(child: Text("time is ${clock.time()}"));
  }
}

class SandGlass {
  int _sand = 0;

  time(){
    return _sand;
  }

  tick() async {
    _sand = 100;
    print('start tick');

    while(_sand >0){
      print('tick: $_sand');
      _sand--;

      await new Future.delayed(Duration(milliseconds: 100));
    }
    
    print('end tick');
  }
}