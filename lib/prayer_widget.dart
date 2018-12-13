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
  var _prayerData;

  @override
  void initState() {
    super.initState();
    _prayerData = loadPrayer();
    _countdown();
  }

  // Go to the next screen
  void _nextScreen() {
    if (_i < maxValue) {
      setState(() {
        _i++;
        _moveOn = false;
      });
      
      // Restart the timer
      _countdown();
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
    return FutureBuilder<dynamic>(
      future: _prayerData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          // This should not be here…
          // and where this goes the first call to _countdown() belongs
          maxValue = snapshot.data.prayers.length - 1;

          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.prayers[_i].name),
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: Text(snapshot.data.prayers[_i].body),
            ),
            floatingActionButton: _moveOn ? FloatingActionButton(
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
            ) : null
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text("Loading…"),
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Prayer…"),
    //     automaticallyImplyLeading: false,
    //   ),
    //   body: Center(
    //     child: FutureBuilder<dynamic>(
    //       future: _prayerData,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           maxValue = snapshot.data.prayers.length - 1;
    //           return Text(
    //               '${snapshot.data.prayers[_i].name}: ${snapshot.data.prayers[_i].body}');
    //         } else {
    //           return CircularProgressIndicator();
    //         }
    //       }
    //     ),
    //   ),
    //   floatingActionButton: _moveOn ? FloatingActionButton(
    //     onPressed: !_moveOn ? null : () {
    //       if (_i >= maxValue) {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => EndCardScreen()),
    //         );
    //       } else {
    //         _nextScreen();
    //       }
    //     },
    //     child: new Icon(Icons.navigate_next)
    //   ) : null
    // );
  }
}
