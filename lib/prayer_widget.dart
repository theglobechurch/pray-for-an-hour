import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pray_for_an_hour/services/prayer_services.dart';
import 'package:pray_for_an_hour/endcard_widget.dart';

class PrayerScreen extends StatefulWidget {
  @override
  _PrayerScreenState createState() => new _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  int _i = 0;
  bool _moveOn = false;
  int maxValue = 11;
  var t;

  @override
  void initState() {
    _countdown();
  }

  // Go to the next screen
  void _nextScreen() {
    if (_i < maxValue) {

      setState(() {
        _i++;
        _moveOn = false;
      });
      
      _countdown();
    }
  }

  _countdown() {
    t = new Timer(Duration(seconds: 5), (){
      _timerComplete();
    });
  }

  _timerComplete() {
    debugPrint('⏰ Timer Complete');

    setState(() {
      _moveOn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Prayer…"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(children: [
          RaisedButton(
            
            onPressed: !_moveOn ? null : () {
              if (_i >= maxValue) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EndCardScreen()),
                );
              } else {
                _nextScreen();
              }
            },
            
            child: Text((_i < maxValue) ? 'Next' : 'End'),
          ),
          FutureBuilder<dynamic>(
              future: loadPrayer(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  maxValue = snapshot.data.prayers.length - 1;
                  return Text(
                      '${snapshot.data.prayers[_i].name}: ${snapshot.data.prayers[_i].body}');
                } else {
                  return CircularProgressIndicator();
                }
              })
        ])));
  }
}
