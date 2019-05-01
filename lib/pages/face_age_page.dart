import 'package:flutter/material.dart';

import '../components/function_items.dart';
import '../components/menus.dart';

class FaceAgePage extends StatefulWidget {
  @override
  _FaceAgePageState createState() => _FaceAgePageState();
}

class _FaceAgePageState extends State<FaceAgePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FaceAge"),
        actions: <Widget>[Menus()],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FunctionItems(),
          ),
        ),
      ),
    );
  }
}
