import 'package:flutter/material.dart';
class tile extends StatefulWidget {
final String language;

tile({@required this.language});

  @override
  _tileState createState() => _tileState();
}

class _tileState extends State<tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          widget.language
      ),
      //trailing: Icon(Icons.arrow_downward),
      onTap: () {
        setState(() {

        });
        print('downloading');
      },
      trailing: Icon(
        Icons.arrow_downward,
      ),
    );
  }
}

