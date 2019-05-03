import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart' as config;

class NickNameInputDialog extends StatefulWidget {
  @override
  _NickNameInputDialogState createState() => _NickNameInputDialogState();
}

class _NickNameInputDialogState extends State<NickNameInputDialog> {
  TextEditingController _textEditingController = TextEditingController();
  bool _validating = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _check() async {
    final text = _textEditingController.text;
    if (text.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: const Text("昵称不能为空"),
        duration: const Duration(seconds: 2),
      ));
    } else {
      http.Response response = await http.get("${config.nickNameUrl}$text");
      if (response.statusCode == 200) {
        int code = json.decode(response.body)["errcode"];
        switch (code) {
          case 0:
            config.setNickName(text);
            Navigator.of(context).pop("昵称设置成功");
            break;
          case 2:
            Navigator.of(context).pop("昵称已存在");
            break;
          default:
        }
      } else {
        Navigator.of(context).pop("网络或服务器异常");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        "请输入昵称",
        style: Theme.of(context)
            .textTheme
            .title
            .copyWith(fontWeight: FontWeight.bold),
      ),
      contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 10.0),
      children: <Widget>[
        TextField(
          controller: _textEditingController,
        ),
        Container(
          height: 10.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: !_validating
                  ? Text(
                      "验证",
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  : SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
              onPressed: () {
                if (!_validating) {
                  setState(() {
                    _validating = true;
                  });
                  _check();
                }
              },
            )
          ],
        )
      ],
    );
  }
}
