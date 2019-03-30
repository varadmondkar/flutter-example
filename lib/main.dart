import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: new HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Color.fromRGBO(0, 230, 19, 99.0),
          brightness: Brightness.light),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myText = "Hello World!!";

  void _changeMyText() {
    setState(() {
      if (myText.startsWith("H")) {
        myText = "Welcome to Flutter Framework!!";
      } else {
        myText = "Hello World!!";
      }
    });
  }

  Widget _bodyWidget() {
    return Container(
      padding: EdgeInsets.all(50.0),
      child: Center(
        child: Column(
          key: Key("varad"),
          children: <Widget>[
            Text(
              myText,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterApp"),
        bottomOpacity: 1.5,
        elevation: 5.0,
      ),
      body: Center(
        child: _bodyWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _changeMyText,
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.mouse,
          color: Colors.white,
        ),
      ),
    );
  }
}
