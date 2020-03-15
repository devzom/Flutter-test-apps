import 'package:flutter/material.dart';

class screen2 extends StatefulWidget {
  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen2'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.pushNamed(context, '/screen3');
            },
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text('screen2'),
        ),
      ),
    );
  }
}
