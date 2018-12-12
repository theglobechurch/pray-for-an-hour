import 'package:flutter/material.dart';
import 'endcardwidget.dart';

class PrayerScreen extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Prayer…"),
        automaticallyImplyLeading: false,
    ),
    body: Center(
      child: RaisedButton(
        onPressed: () {
          // Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EndCardScreen()),
          );
        },
        child: Text('End'),
      ),
    )
  );
 }
}
