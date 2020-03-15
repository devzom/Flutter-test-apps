import 'package:flutter/material.dart';
import 'package:lists_JSON_test/views/user_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eBike',
        theme: ThemeData(primaryColor: Colors.amber),
        home:
            // BikesList(title: 'bikes'));
            Scaffold(
                appBar: AppBar(
                  title: Text('eBike',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400)),
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.settings, color: Colors.white),
                      onPressed: () {},
                    )
                  ],
                ),
                body: UserProfile()));
  }
}
