import 'package:flutter/material.dart';
import 'package:pray_for_an_hour/services/prayer_services.dart';
import 'package:pray_for_an_hour/endcardwidget.dart';

class PrayerScreen extends StatefulWidget {
  @override
  _PrayerScreenState createState() => new _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  int _i = 0;
  int maxValue = null;

  // Go to the next screen
  void _nextScreen() {
    setState(() {
      if (_i < maxValue) {
        _i++;
      }
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
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                if (_i >= maxValue) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EndCardScreen()),
                  );
                } else {
                  _nextScreen();
                }
              },
            child: Text('End'),
            ),
            FutureBuilder<dynamic>(
              future: loadPrayer(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  maxValue = snapshot.data.prayers.length - 1;
                  return Text('${snapshot.data.prayers[_i].name}: ${snapshot.data.prayers[_i].body}');
                } else {
                  return CircularProgressIndicator();
                }
              }
            )
          ]
        )
      )
    );
  }
}
