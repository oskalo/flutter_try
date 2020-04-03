import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

enum GenderList{male, female}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {

  GenderList _gender;
  final _fromKey = GlobalKey<FormState>();
  bool _agreement = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(10.0),
        child: new Form(key: _fromKey, child: new Column(children: <Widget>[
          // NAME
          new Text("User name ", style: TextStyle(fontSize: 20.0)),
          new TextFormField(validator: (value){
            if (value.isEmpty) return "please enter your name";
          }),

          new SizedBox(height: 20.0),

          // MAIL
          new Text("email", style: TextStyle(fontSize: 20.0)),
          new TextFormField(validator: (value){
            if (value.isEmpty) return "please enter your email";
            if (!isEmail(value)) return "it is not  E-mail";
            return null;
          }),

          new SizedBox(height: 20.0),

          // GENDER
          new Text("gender", style: TextStyle(fontSize: 20.0)),
          new RadioListTile(title: Text("male"), value: GenderList.male, groupValue: _gender, onChanged: (GenderList value){
            setState(() {
              _gender = value;
            });
          }),
          new RadioListTile(title: Text("female"), value: GenderList.female, groupValue: _gender, onChanged: (GenderList value){
            setState(() {
              _gender = value;
            });
          }),

          new SizedBox(height: 20.0),

          new CheckboxListTile(value: _agreement,
              title: new Text("I egree to sell all"),
              onChanged: (bool value) => setState(() => _agreement = value)),
          new SizedBox(height: 20.0),

          new RaisedButton(onPressed: (){
            if (_fromKey.currentState.validate()) {
              Color color = Colors.red;
              String text;


              if (_gender == null) text = "You didn't chouse gender";
              else if(_agreement == false) text = "pull agree mather fucker";
              else {
                text = "Form good";
                color = Colors.green;
              }

              Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(text), backgroundColor: color));
            }


          }, child: Text("Check"), color: Colors.blue, textColor: Colors.white)
        ],))
    );
  }
}

void main() => runApp(
new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new Scaffold(
    appBar: new AppBar(title: new Text("data")),
    body: MyForm()
  )
)
);
