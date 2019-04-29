import 'package:flutter/material.dart';

class FunctionItem extends StatelessWidget {
  final String title;
  final String description;
  final String actionName;
  final void Function() action;

  FunctionItem(
      {@required this.title,
      @required this.description,
      @required this.actionName,
      @required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.title,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 5.0,
              ),
              Text(this.description),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      this.actionName,
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    onPressed: action,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
