import 'package:flutter/material.dart';
import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';

import '../constants.dart';

class tile extends StatefulWidget {
  final String language;
  final String languageCode;
  tile({@required this.language, @required this.languageCode});

  @override
  _tileState createState() => _tileState();
}

class _tileState extends State<tile> {
  final ModelManager modelManager = FirebaseLanguage.instance.modelManager();
  bool downloadState = false;

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
      onTap: () {
        if (downloadState == false) {
          modelManager.downloadModel(widget.languageCode);
          print('downloading');
        } else {
          modelManager.deleteModel(widget.languageCode);
          print('deleting');
        }
        setState(() {
          downloadState = !downloadState;
        });
      },
      trailing: Icon(
        downloadState ? Icons.delete : Icons.arrow_downward,
        color: downloadState ? Colors.black : Colors.blue,
      ),
    );
  }
}
