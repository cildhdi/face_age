import 'package:flutter/material.dart';

enum MenuType { ABOUT_US, VIEW_LICENSE }


class Menus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry<MenuType>>[
                PopupMenuItem(
                  value: MenuType.ABOUT_US,
                  child: Text("关于我们"),
                ),
                PopupMenuItem(
                  value: MenuType.VIEW_LICENSE,
                  child: Text("查看证书"),
                ),
              ];
            },
            onSelected: (MenuType type) {
              switch (type) {
                case MenuType.ABOUT_US:
                  break;
                case MenuType.VIEW_LICENSE:
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
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