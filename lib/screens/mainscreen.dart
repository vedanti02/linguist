import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linguist/constants.dart';
import 'package:linguist/screens/tile.dart';
import 'tile.dart';


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

            tile(
              language: 'English',
            ),
            tile(
              language: 'French',
            ),
            tile(
              language: 'Italian',
            ),
            tile(
              language: 'Portuguese',
            ),
            tile(
              language: 'Romanian',
            ),
            tile(
              language: 'Spanish',
            ),
            tile(
              language: 'Dutch',
            ),
            tile(
              language: 'Finnish',
            ),
            tile(
              language: 'German',
            ),
            tile(
              language: 'Polish',
            ),
            tile(
              language: 'Kannada',
            ),
            tile(
              language: 'Marathi',
            ),
            tile(
              language: 'Gujarati',
            ),
            tile(
              language: 'Hindi',
            ),
            tile(
              language: 'Tamil',
            ),
            tile(
              language: 'Urdu',
            ),
            tile(
              language: 'Arabic',
            ),
          ],
        ),
      ),
    );
  }
}
