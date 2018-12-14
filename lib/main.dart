import 'package:flutter/material.dart';
import 'package:pray_for_an_hour/prayer_widget.dart';
import 'package:pray_for_an_hour/colours.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Pray for an Hour',
      home: HomeScreen(),
      theme: _buildLightTheme(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget headerSection = Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'PRAY',
              style: TextStyle(
                fontSize: 65.0,
                fontWeight: FontWeight.w800,
                color: kSurface,
              ),
            ),
            decoration: BoxDecoration(
              color: kPrimaryBlue,
            ),
            alignment: Alignment(0.0, 1.0),
            height: 100,
            padding: EdgeInsets.all(0),
          ),
          Text(
            'for an',
            style: TextStyle(
                fontSize: 24.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: kPrimaryBlue,
              ),
          ),
          Text(
            'HOUR',
            style: TextStyle(
              fontSize: 100.0,
              fontWeight: FontWeight.w800,
              color: kPrimaryBlue,
            ),
          ),
        ]
      )
    );

    Widget startSection = Material(
      color: kSurface,
      child: Container(
        child: InkWell(
          child: Container(
            child: Center(
              child: Text(
                'START',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w800,
                  color: kPrimaryBlue,
                ),
              ),
            ),
            height: 50.0,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryBlue, width: 4.0),
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrayerScreen()),
            );
          },
        ),
        padding: EdgeInsets.all(16.0),
      )
    );

    return Scaffold(
      body: Center(
        child: Container(
          child: Container (
            child: Column(
              children:[
                headerSection,
                startSection,
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      ),
    );
  }
}

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kPrimaryBlue,
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, kSurface),
    primaryIconTheme: base.iconTheme.copyWith(color: kSurface),
    buttonColor: kPrimaryBlue,
    accentColor: kSecondaryBlue,
    scaffoldBackgroundColor: kSurface,
    textTheme: _buildTextTheme(base.textTheme, kSurface)
  );
}

TextTheme _buildTextTheme(TextTheme base, Color color) {
  return base
    .copyWith(
      headline: base.headline.copyWith(
        fontWeight: FontWeight.w500,
      ),
      title: base.title.copyWith(fontSize: 18.0),
      caption: base.caption.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      )
      .apply(
        color: color,
      )
    );
}
