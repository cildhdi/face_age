import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                }
              },
            )
          ],
        )
      ],
    );
  }
}
