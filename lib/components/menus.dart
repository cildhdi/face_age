import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'nick_name_input_dialog.dart';

enum MenuType { RESET_NICKNAME, ABOUT }

class Menus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return <PopupMenuEntry<MenuType>>[
          PopupMenuItem(
            value: MenuType.RESET_NICKNAME,
            child: Text("重置昵称"),
          ),
          PopupMenuItem(
            value: MenuType.ABOUT,
            child: Text("关于"),
          ),
        ];
      },
      onSelected: (MenuType type) {
        switch (type) {
          case MenuType.RESET_NICKNAME:
            showCupertinoDialog(
                context: context,
                builder: (context) {
                  return NickNameInputDialog();
                }).then((res) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(res ?? "设置失败"),
                duration: const Duration(seconds: 2),
              ));
            });
            break;
          case MenuType.ABOUT:
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LicensePage(
                applicationName: "面部年龄识别",
                applicationLegalese: "本APP仅用于上海大学计算机高年级研讨课项目。",
              );
            }));
            break;
          default:
        }
      },
    );
  }
}
