import 'package:flutter/material.dart';
import 'screens/mainscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: MainScreen.id, routes: {
      MainScreen.id: (context) => MainScreen(),
//          Camera.id: (context) => Camera(),
    });
  }
}
