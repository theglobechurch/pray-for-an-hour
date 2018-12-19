import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:pray_for_an_hour/services/prayer_services.dart';
import 'package:pray_for_an_hour/endcard_widget.dart';
import 'package:pray_for_an_hour/colours.dart';
import 'package:pray_for_an_hour/widgets/column_spacer.dart';

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
  static AudioCache player = new AudioCache();

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
    const alarmAudioPath = "sound/ding.mp3";
    player.play(alarmAudioPath);
    setState((){ _moveOn = true; });
  }

  @override
  Widget build(BuildContext context) {

    Widget scripture(passage) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
              passage.body,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: kPrimaryBlue,
              ),
            ),
            Text(
              passage.reference,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: kPrimaryBlue,
              ),
            ),
          ],
        ),
        alignment: Alignment(-1, 0),
        padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
        decoration: new BoxDecoration(
          border: new Border(
            left: BorderSide(
              width: 8.0,
              color: kWhite
            )
          ),
        ),
      );
    }

    Widget prayerLine(line) {
      return Container(
        child: Text(
          line,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
            color: kPrimaryBlue,
          ),
        ),
        alignment: Alignment(-1, 0),
      );
    }

    Widget prayerTitle(title) {
      return Container(
        child: Container (
          child: Text(
            title.toUpperCase(),
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

    Widget prayerBody(List contents) {
      return new Container(
        child: ColumnSpacer(
          spacing: 16.0,
          children: contents.map((i){
            if (i.type == 'scripture'){
              return scripture(i);
            } else {
              return prayerLine(i.body);
            }
          }).toList()
        ),
        padding: EdgeInsets.all(16.0),
      );
    }

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

    Widget prayerItemBody(data) {
      return Container(
        child: Container (
          child: Column(
            children: [
              prayerTitle(data.name),
              prayerBody(data.prayerContents)
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
    }

    return FutureBuilder<dynamic>(
      future: _prayerData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: prayerItemBody(snapshot.data.prayers[_i]),
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
