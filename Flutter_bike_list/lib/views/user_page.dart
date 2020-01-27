import 'package:flutter/material.dart';
import '../class/User_class.dart';

class UserProfile extends StatelessWidget {
  final String user;

  const UserProfile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
      child: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
                child: Text('Image'),
                backgroundColor: Colors.cyan.shade200,
                foregroundColor: Colors.white,
                maxRadius: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Name: $user.username'),
                Text('Lastname: $user.lastname')
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: DecoratedBox(decoration: ,),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    'Details',
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                CheckboxListTile(
                  value: false,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
