import 'package:flutter/material.dart';
import 'dart:convert';

import 'endcardwidget.dart';

class PrayerScreen extends StatefulWidget {
  @override
  _PrayerScreenState createState() => new _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  int _i = 0;
  final maxValue = 11;
  Map<String, dynamic> prayerData;

  @override
  void initState() {
    fetchPrayerData();
  }

  fetchPrayerData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/data/default.json");
    setState(() {
      prayerData = json.decode(data);
    });
  }

  // Go to the next screen
  void _nextScreen() {
    setState(() {
      if (_i < maxValue) {
        _i++;
        print(_i);
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
            Text(
              '$prayerData[$_i]'
            )
          ]
        )
      )
    );
  }

}
