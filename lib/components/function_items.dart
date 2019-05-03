import 'package:face_age/components/face_age_recognize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart' as config;
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
              "    人脸识别是计算机视觉的一个重要领域，我们的项目是利用Keras（Python中的神经网络库）进行模型训练和分析，引入大量不同年龄段的人脸图像数据，提取人脸特征，通过降维等方法进行数据处理之后编译模型、训练模型、评估模型，最后实现能够让机器判别一张新的人脸图片的大致年龄段。",
          actionName: "详细介绍",
          action: () {},
        ),
        FunctionItem(
          title: "面部年龄识别",
          description:
              "    上传照片到服务器进行面部年龄识别，服务器在识别完成后会立即删除您的照片，仅会保留您设置的个人昵称以及识别结果。",
          actionName: "进入",
          action: () async {
            final nickName = await config.getNickName();
            if (nickName.isEmpty) {
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
            } else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FaceAgeRecognizePage(
                  nickName: nickName,
                );
              }));
            }
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
