import 'package:flutter/material.dart';

class FaceAgeRecognizePage extends StatefulWidget {
  final nickName;

  FaceAgeRecognizePage({@required this.nickName});

  @override
  _FaceAgeRecognizePageState createState() => _FaceAgeRecognizePageState();
}

class _FaceAgeRecognizePageState extends State<FaceAgeRecognizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("面部年龄识别"),
      ),
      body: Container(),
    );
  }
}
