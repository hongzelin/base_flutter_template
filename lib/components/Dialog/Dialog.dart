/*
 * Author: lin.zehong 
 * Date: 2020-07-04 12:27:54 
 * Desc: 自定义 Dialog
 */
import 'package:flutter/material.dart';

class DialogPage extends Dialog {
  final String title;
  final String content;

  DialogPage({this.title = "标题", this.content = "内容"});

  @override
  Widget build(BuildContext context) {
    return new Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        '${this.title}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                          Navigator.pop(context);
                          print('xxx');
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${this.content}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
