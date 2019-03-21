import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "StatefulWidget Example", home: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<StatefulWidget> {
  String displayText = "Welcome to Flutter Application";
  int _counter = 0;

  void updateText() {
    _counter++;
    setState(() {
      displayText = "Thanks for your click $_counter.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefulWidget Example"),
      ),
      body: Center(
        child: Text(displayText),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: "Click to update the text",
        child: Icon(Icons.adb),
        onPressed: updateText,
        backgroundColor: Colors.teal,
      ),
    );
  }
}
