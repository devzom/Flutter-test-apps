import 'package:flutter/material.dart';

class screen3 extends StatefulWidget {
  @override
  _screen3State createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen3'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text('screen3'),
        ),
      ),
    );
  }
}
