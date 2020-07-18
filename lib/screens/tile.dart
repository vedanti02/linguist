import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';

import '../constants.dart';

class tile extends StatefulWidget {
  final String language;
  final String languageCode;
  tile({@required this.language, @required this.languageCode});

  @override
  _tileState createState() => new _tileState();
}


class _tileState extends State<tile> with TickerProviderStateMixin{
  int _state=0;


  void animateButton(){
    setState(() {
      _state=1;
    });
    Timer(Duration(milliseconds: 3300),(){
      setState(() {
        _state=2;
      });

  });
}




  final ModelManager modelManager = FirebaseLanguage.instance.modelManager();
  bool downloadState = false;
  String currentStatus;
  Future<void> checkStatus(String langCode) async {
    bool status = false;
    List<String> downloadedList = await modelManager.viewModels();
    print(downloadedList);
    for (int i = 0; i < downloadedList.length; i++) {
      if (downloadedList[i] == langCode) {
        downloadState = true;
        break;
      }
    }
  }

  Widget trail_icon(){
    if(_state==0){
      return Icon(Icons.arrow_downward);
    }
    else if (_state==1){
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
    else{
      return Icon(Icons.delete);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStatus(widget.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.language,
        style: downloadState ? offline : online,
      ),
      //trailing: Icon(Icons.arrow_downward),
      onTap: () async {
        if (_state==0){
          animateButton();
        }
        if (downloadState == false) {
          currentStatus = await modelManager.downloadModel(widget.languageCode);
          print('downloading ... $currentStatus');
        } else {
          currentStatus = await modelManager.deleteModel(widget.languageCode);
          print('deleting ... $currentStatus');
        }
        setState(() {
          downloadState = !downloadState;
        });
      },



//      trailing: Icon(
//        downloadState ? Icons.delete : Icons.arrow_downward,
//        color: downloadState ? Colors.black : Colors.blue,

    );

  }

}