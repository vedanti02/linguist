import 'package:flutter/material.dart';
class tile extends StatefulWidget {
final String language;
var id=0;
tile({@required this.language});

  @override
  _tileState createState() => _tileState();
}

class _tileState extends State<tile> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: ListTile(
            title: Text(widget.language),
            trailing: (_active ? Icon(Icons.delete) : Icon(
                Icons.arrow_downward)),
          ),
        ),
      );
    }
  }

