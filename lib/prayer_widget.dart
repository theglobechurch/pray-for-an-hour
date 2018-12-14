import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pray_for_an_hour/services/prayer_services.dart';
import 'package:pray_for_an_hour/endcard_widget.dart';
import 'package:pray_for_an_hour/colours.dart';

class PrayerScreen extends StatefulWidget {
  @override
  _PrayerScreenState createState() => new _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  int _i = 0;
  bool _moveOn = false;
  int maxValue = 11;
  var t;
  var _prayerData;

  @override
  void initState() {
    super.initState();
    _prayerData = loadPrayer();

    _prayerData.then((dynamic result) {
      maxValue = result.prayers.length - 1;
      _countdown();
    });
  }

  // Go to the next screen
  void _nextScreen() {
    if (_i < maxValue) {
      setState(() {
        _i++;
        _moveOn = false;
        _countdown();
      });
    }
  }

  _countdown() {
    t = new Timer(Duration(seconds: 2), (){
      _timerComplete();
    });
  }

  _timerComplete() {
    debugPrint('⏰ Timer Complete');
    setState((){ _moveOn = true; });
  }

  @override
  Widget build(BuildContext context) {

    Widget title = FutureBuilder<dynamic>(
      future: _prayerData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Container (
              child: Text(
                snapshot.data.prayers[_i].name,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w800,
                  color: kSurface,
                ),
              ),
              color: kPrimaryBlue,
              padding: EdgeInsets.fromLTRB(16.0, 2.0, 8.0, 2.0),
            ),
            padding: EdgeInsets.only(top: 16.0),
            alignment: Alignment(-1, 0),
          );
        }
      }
    );

    Widget body = FutureBuilder<dynamic>(
      future: _prayerData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Text(
              snapshot.data.prayers[_i].body
            ),
            padding: EdgeInsets.all(16.0),
          );
        }
      }
    );

    Widget btnAdvance = FloatingActionButton(
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
      child: new Icon(Icons.navigate_next)
    );

    Widget loadedBody = Container(
      child: Container (
        child: Column(
          children:[
            title,
            body
          ]
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: kPrimaryBlue,
            width: 16.0,
          ),
        ),
        alignment: Alignment(0, 0),
      ),
      padding: EdgeInsets.all(32.0),
      alignment: Alignment(0, 0),
    );

    return FutureBuilder<dynamic>(
      future: _prayerData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: loadedBody,
            floatingActionButton: _moveOn ? btnAdvance : null
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }
    );
  }
}
