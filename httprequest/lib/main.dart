import 'package:flutter/material.dart';
import 'package:httprequest/screen2.dart';
import 'package:httprequest/screen3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick ToDO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Quick ToDo'),
      routes: <String, WidgetBuilder>{
        "/screen2": (BuildContext context) => screen2(),
        "/screen3": (BuildContext context) => screen3(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input = '';
  List list = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  var flatButton = FlatButton(
                    child: Text("Add"),
                    onPressed: () {
                      setState(() {
                        list.add(input);
                      });
                      Navigator.of(context).pop();
                    },
                  );
                  return AlertDialog(
                    title: Text('Add new task'),
                    content: TextField(
                      onChanged: (String value) {
                        input = value;
                      },
                      autofocus: true,
                      minLines: 1,
                    ),
                    actions: <Widget>[flatButton],
                  );
                });
          },
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(list[index]),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(list[index]),
                    trailing: FlatButton(
                        onPressed: () {
                          setState(() {
                            list.removeAt(index);
                          });
                        },
                        child: Icon(Icons.close)),
                    leading: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.pink,
                  )
                ],
              ),
              onDismissed: (direction) {
                setState(() {
                  list.removeAt(index);
                });
              },
            );
          },
        ));
  }
}
