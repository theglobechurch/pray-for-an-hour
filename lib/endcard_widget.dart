import 'package:flutter/material.dart';

class EndCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The end"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('Start again'),
        ),
      )
    );
  }
}
