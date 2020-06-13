import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linguist/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class Camera extends StatefulWidget {
  static const String id = 'camrea';
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  var text = '';
  File ImageFile;
  bool isImage = false;
  var picture;
  var cropped;

  void initstate() {
    _showChoiceDialogue(context);
    super.initState();
  }
  Future<void> _cropImage(picture) async{
    cropped= await ImageCropper.cropImage(
        sourcePath: picture.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: TextColor,
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: TextColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
      if(cropped!= null){
        setState(() {
          ImageFile= cropped;
          isImage= true;
        });


    }


  }


  Future _openCamera(BuildContext context) async {
    picture = await ImagePicker.pickImage(source: ImageSource.camera);
    if(picture!= null){
      this.setState(() {
        _cropImage(picture);
      });
    }

  }

  Future _openGallery(BuildContext context) async {
    picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(picture!=null) {
      this.setState(() {
        _cropImage(picture);
      });
    }
  }

  Future readText() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(ImageFile);
    TextRecognizer ourtext = FirebaseVision.instance.textRecognizer();
    VisionText readtext = await ourtext.processImage(ourImage);

    for (TextBlock i in readtext.blocks) {
      for (TextLine j in i.lines) {
        for (TextElement k in j.elements) {
          setState(() {
            print(text = text + k.text + ' ');
          });
        }
        // text=text+'\n';
      }
    }
    ourtext.close();
  }

  Future<void> _showChoiceDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                      Navigator.pop(context);
                    }),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _openGallery(context);
                      Navigator.pop(context);
                    }),
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9D9D9),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isImage
                ? Center(
                    child: Container(
                      width: 300.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: FileImage(ImageFile),
                        fit: BoxFit.fitWidth,
                      )),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 60.0,
            ),
            Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    // ignore: unnecessary_statements
                    _showChoiceDialogue(context);
                  },
                  child: Container(
                    height: 70,
                    width: 200.0,
                    padding: EdgeInsets.all(10.0),
                    decoration: kBoxdec,
                    child: Center(
                      child: Text(
                        'Select Image',
                        style: kTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                FlatButton(
                  onPressed: () {
                    readText();
                  },
                  child: Container(
                    decoration: kBoxdec,
                    height: 70,
                    width: 200.0,
                    child: Center(
                      child: Text(
                        'Translate',
                        style: kTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
