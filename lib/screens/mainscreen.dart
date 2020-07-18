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
              languageCode: 'en',
            ),
            tile(
              language: 'French',
              languageCode: 'fr',
            ),
            tile(
              language: 'Italian',
              languageCode: 'it',
            ),
            tile(
              language: 'Portuguese',
              languageCode: 'pt',
            ),
            tile(
              language: 'Romanian',
              languageCode: 'ro',
            ),
            tile(
              language: 'Spanish',
              languageCode: 'es',
            ),
            tile(
              language: 'Dutch',
              languageCode: 'nl',
            ),
            tile(
              language: 'Finnish',
              languageCode: 'fi',
            ),
            tile(
              language: 'German',
              languageCode: 'de',
            ),
            tile(
              language: 'Polish',
              languageCode: 'pl',
            ),
            tile(
              language: 'Kannada',
              languageCode: 'kn',
            ),
            tile(
              language: 'Marathi',
              languageCode: 'mr',
            ),
            tile(
              language: 'Gujarati',
              languageCode: 'gu',
            ),
            tile(
              language: 'Hindi',
              languageCode: 'hi',
            ),
            tile(
              language: 'Tamil',
              languageCode: 'ta',
            ),
            tile(
              language: 'Urdu',
              languageCode: 'ur',
            ),
            tile(
              language: 'Arabic',
              languageCode: 'ar',
            ),
          ],
        ),
      ),
    );
  }
}
