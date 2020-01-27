import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'class/Bikeinfo_class.dart';

class BikesList extends StatefulWidget {
  final String title;

  const BikesList({Key key, this.title}) : super(key: key);
  @override
  _BikesListState createState() => _BikesListState();
}

class _BikesListState extends State<BikesList> {
  var bikes = const [
    // {"name": "Romet 1", "rider": "Penddreth"},
    // {"name": "Romet 2", "rider": "Frediani"},
    // {"name": "Romet 3", "rider": "Bea"},
    // {"name": "Romet 4", "rider": "Valek"}
  ];

  Future loadBikeList() async {
    String content = await rootBundle.loadString('data/bikelist.json');
    List collection = json.decode(content);
    List<Bikeinfo> _bikes =
        collection.map((json) => Bikeinfo.fromJson(json)).toList();

    setState(() {
      bikes = _bikes;
    });
  }

  void initState() {
    loadBikeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: bikes.length,
      itemBuilder: (BuildContext context, int index) {
        Bikeinfo bike = bikes[index];
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.directions_bike, color: Colors.white),
            backgroundColor: Colors.amber,
          ),
          title: Text(bike.name),
          subtitle: Text(bike.rider),57 6 6  6
          trailing: FlatButton(
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            onPressed: () {},
          ),
          isThreeLine: true,
        );
      },
    );
  }
}
