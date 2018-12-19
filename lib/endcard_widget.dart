import 'package:flutter/material.dart';
import 'package:pray_for_an_hour/colours.dart';

class EndCardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget btnRestart = Material(
      color: kSurface,
      child: Container(
        child: InkWell(
          child: Container(
            child: Center(
              child: Text(
                'START AGAIN',
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
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        padding: EdgeInsets.all(16.0),
      )
    );

    Widget encourager = Container(
      child: Text(
        'Who could you encourage by letting them know that you have been praying for them?',
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w400,
          color: kPrimaryBlue,
        ),
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.all(16.0),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Container (
            child: Column(
              children:[
                encourager,
                btnRestart
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
      )
    );
  }
}
