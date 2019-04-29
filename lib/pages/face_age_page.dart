import 'package:flutter/material.dart';

import '../components/function_item.dart';

class FaceAgePage extends StatefulWidget {
  @override
  _FaceAgePageState createState() => _FaceAgePageState();
}

enum MenuType { ABOUT_US, VIEW_LICENSE }

class _FaceAgePageState extends State<FaceAgePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FaceAge"),
        actions: <Widget>[
          PopupMenuButton(
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
          )
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                FunctionItem(
                  title: "研讨项目介绍",
                  description:
                      "    Keras是一个高层神经网络API，Keras由纯Python编写而成并基Tensorflow、Theano以及CNTK后端。Keras 为支持快速实验而生，能够把你的idea迅速转换为结果。",
                  actionName: "详细介绍",
                  action: () {},
                ),
                FunctionItem(
                  title: "面部年龄识别",
                  description:
                      "    这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述",
                  actionName: "进入",
                  action: () {},
                ),
                FunctionItem(
                  title: "比一比，谁更老",
                  description:
                      "    这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述",
                  actionName: "进入",
                  action: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
