import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FaceAgeRecognizePage extends StatefulWidget {
  final nickName;

  FaceAgeRecognizePage({@required this.nickName});

  @override
  _FaceAgeRecognizePageState createState() => _FaceAgeRecognizePageState();
}

class _FaceAgeRecognizePageState extends State<FaceAgeRecognizePage> {
  File _image;

  Future getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    setState(() {
      _image = image;
    });
  }

  Future uploadImage(BuildContext context) async {
    debugPrint("dhsidhas");
    Scaffold.of(context).showSnackBar(SnackBar(
      content: const Text("未选择图片"),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("面部年龄识别"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    child: const Text("相机拍照"),
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                  ),
                  Container(
                    width: 20.0,
                  ),
                  RaisedButton(
                    child: const Text("相册选择"),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 40.0,
            ),
            _image == null ? const Text('未选择图片') : Image.file(_image),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
              child: Icon(Icons.file_upload),
              onPressed: () async {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: const Text("未选择图片"),
                  duration: Duration(seconds: 2),
                ));
              });
        },
      ),
    );
  }
}
