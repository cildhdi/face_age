import 'package:flutter/material.dart';

import 'pages/face_age_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceAge',
      theme: ThemeData.light(),
      home: FaceAgePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
