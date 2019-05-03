import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

const server = "http://www.cildhdi.top";

final String nickNameUrl = "$server/faceage/nickName?nickName=";
final String recognizeUrl = "$server/faceage/recognize";

const String nickNamePref = "nickName";

Future<String> getNickName() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString(nickNamePref) ?? "";
}

void setNickName(String nickName) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(nickNamePref, nickName);
}
