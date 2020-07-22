/*
 * Author: lin.zehong 
 * Date: 2020-07-21 21:27:39 
 * Desc: 工具类 
 */
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToolUtils {
  // 判断 字符串 是否为空
  static bool isNullOrEmpty(String str) {
    return str == null || str.length <= 0;
  }

  // 标题符号转换
  static String signToStr(String str) {
    return str
        .replaceAll(RegExp("(<em[^>]*>)|(</em>)"), "")
        .replaceAll(RegExp("\n{2,}"), "\n")
        .replaceAll(RegExp("\s{2,}"), " ")
        .replaceAll("&ndash;", "–")
        .replaceAll("&mdash;", "—")
        .replaceAll("&lsquo;", "‘")
        .replaceAll("&rsquo;", "’")
        .replaceAll("&sbquo;", "‚")
        .replaceAll("&ldquo;", "“")
        .replaceAll("&rdquo;", "”")
        .replaceAll("&bdquo;", "„")
        .replaceAll("&amp;", "&")
        .replaceAll("&permil;", "‰")
        .replaceAll("&lsaquo;", "‹")
        .replaceAll("&rsaquo;", "›")
        .replaceAll("&euro;", "€")
        .replaceAll("&quot;", "'")
        .replaceAll("<p>", "")
        .replaceAll("&middot;", "·")
        .replaceAll("&hellip;", "...")
        .replaceAll("</p>", "")
        .replaceAll("</br>", "\n")
        .replaceAll("<br>", "\n");
  }

  // 获取主题颜色
  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  // object 转为 string json
  static String object2string<T>(T t) {
    return fluroCnParamsEncode(jsonEncode(t));
  }

  static String fluroCnParamsEncode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }

  // string json 转为 map
  static Map<String, dynamic> string2map(String str) {
    return json.decode(fluroCnParamsDecode(str));
  }

  // fluro 传递后取出参数，解析
  static String fluroCnParamsDecode(String encodeCn) {
    var list = List<int>();

    ///字符串解码
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }

  //Dialog 封装
  static void showAlertDialog(BuildContext context, String contentText,
      {Function confirmCallback,
      Function dismissCallback,
      String confirmText = ""}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(contentText),
          actions: <Widget>[
            FlatButton(
              child: Text('我手滑了'),
              onPressed: () {
                if (dismissCallback != null) {
                  dismissCallback();
                }
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(confirmText == "" ? '注销' : confirmText),
              onPressed: () {
                if (confirmCallback != null) {
                  confirmCallback();
                }
                Navigator.of(context).pop();
              },
            )
          ],
          elevation: 20, // 阴影
        );
      },
    );
  }

  // 随机获取颜色
  static Color getRandomColor() {
    Random random = Random();
    var temp = random.nextInt(6);
    List<Color> colors = [
      Colors.blueAccent,
      Colors.yellowAccent,
      Colors.redAccent,
      Colors.purpleAccent,
      Colors.lightGreenAccent,
      Colors.deepOrangeAccent,
    ];
    return colors[temp];
  }

  // 随机主题色
  static Color getThemeColor() {
    return Color(0xFF220FFF);
  }

  static Widget getErrorWidget(BuildContext context,
      {Function onPressCallBack}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("页面出错了！！"),
        RaisedButton(
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
          child: Text("重新加载"),
          onPressed: () {
            if (onPressCallBack != null) {
              onPressCallBack();
            }
          },
        )
      ],
    );
  }

  // 递归方式删除目录
  static Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  }

  // 显示 Toast
  static void showToast({String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  /// 设置本地存储
  static Future<void> setStorage(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  /// 获取本地存储
  static Future<String> getStorage(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  /// 删除本地存储
  static Future<void> removeStorage(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }
}
