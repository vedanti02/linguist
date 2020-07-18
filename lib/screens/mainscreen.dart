import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linguist/constants.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'mainscreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bgcolor,
      body: Container(
        child: Center(child: Text('main scr')),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Offline Languages'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('English'),
              trailing: Icon(Icons.arrow_downward),
              onTap: () {
                print('downloading');
              },
            ),
            ListTile(
              title: Text('English'),
              trailing: Icon(Icons.arrow_downward),
              onTap: () {
                print('downloading');
              },
            ),
            ListTile(
              title: Text('English'),
              trailing: Icon(Icons.arrow_downward),
              onTap: () {
                print('downloading');
              },
            ),
          ],
        ),
      ),
    );
  }
}
