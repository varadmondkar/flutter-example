import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TimerState();
}

class TimerState extends State<MyApp> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed += 1;
      });
    }
  }

  @override
  void initState() {
    timer = Timer.periodic(duration, (Timer t) {
      handleTick();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return MaterialApp(
        title: "Timer App Example",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Timer Example"),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextContainer(
                      label: 'HRS',
                      value: hours.toString().padLeft(2, '0'),
                    ),
                    TextContainer(
                      label: 'MINS',
                      value: minutes.toString().padLeft(2, '0'),
                    ),
                    TextContainer(
                      label: 'SECS',
                      value: seconds.toString().padLeft(2, '0'),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      setState(() {
                        isActive = !isActive;
                      });
                    },
                    child: Text(
                      isActive ? 'STOP' : 'START',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ))));
  }
}

class TextContainer extends StatelessWidget {
  TextContainer({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 15.0,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
