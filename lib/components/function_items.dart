import 'package:flutter/material.dart';

import './function_item.dart';
import './nick_name_input_dialog.dart';

class FunctionItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              "    上传照片到服务器进行面部年龄识别，服务器在识别完成后会立即删除您的照片，仅会保留您设置的个人昵称以及识别结果。",
          actionName: "进入",
          action: () {
            showDialog(
                context: context,
                builder: (context) {
                  return NickNameInputDialog();
                });
          },
        ),
        FunctionItem(
          title: "比一比，谁更老",
          description: "    查看所有用户识别结果，只显示昵称以及识别结果。",
          actionName: "进入",
          action: () {},
        ),
      ],
    );
  }
}
