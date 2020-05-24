import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linguist/screens/camrea.dart';
import 'package:linguist/constants.dart';

import 'package:linguist/models/language.dart';

class MainScreen extends StatefulWidget {
  static const String id= 'mainscreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Language> _languages=Language.getlanguage();
  List<DropdownMenuItem<Language>>_dropdownitems;
  Language _selectedLang;
  @override
  void initState(){

    _dropdownitems=builddrpdown (_languages);
    _selectedLang=_dropdownitems[0].value;
    super.initState();

  }
  List<DropdownMenuItem<Language>>builddrpdown(List languages) {
    List<DropdownMenuItem<Language>> items = List();
    for (Language l in languages){
      items.add(
        DropdownMenuItem(
          value: l,
          child: Text(l.name),
        )
      );



    }
    return items;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Bgcolor ,
      body: Container(
        padding:
        EdgeInsets.only(top: 150.0, left: 30.0, right: 30.0, bottom: 30.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Text(
              'Linguist',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TextColor,
                fontFamily: 'Great_Vibes',
                fontSize: 120.0,
                fontWeight: FontWeight.w800,
              ),
            ),
//            SizedBox(
//              height: 10.0,
//            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/icon.jpeg'),
              radius: 60.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              padding: EdgeInsets.only(top:0.0,left: 10.0,bottom: 10.0),
              height: 60.0,
              width: 220.0,
              color: Colors.white,
              child: DropdownButton(
                elevation: 30,
                isExpanded: true,
                value: _selectedLang,
                items: _dropdownitems,

                iconSize: 50.0,
                onChanged: (Language newLang){
                  setState(() {
                    _selectedLang=newLang;
                  });
                },

              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  splashColor: Colors.white,
                  iconSize: 70.0,
                  color: Color(0xFF6B5F6D),
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                   Navigator.pushNamed(context, Camera.id);
                  },
                ),
                SizedBox(
                  width: 60.0,
                ),
                IconButton(
                  iconSize: 70.0,
                  splashColor: Colors.white,
                  icon: Icon(Icons.text_fields),
                  color: Color(0xFF6B5F6D),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

