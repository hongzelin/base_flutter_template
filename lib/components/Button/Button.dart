/*
 * Author: lin.zehong 
 * Date: 2020-06-30 22:21:59 
 * Desc: 按钮组件
 */
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const String _layout = "base";
  static const String _type = "raised";
  static const String _text = "按钮";
  static const Color _color = Color.fromRGBO(39, 45, 221, 1.0);

  final String layout; // 分为两种布局，自适应（row） 和 普通（base） 两种。
  final String type; // 分为两种类型，raised：RaisedButton，outline：OutlineButton
  final String text; // 按钮文本
  final double height; // 按钮高度
  final double width; // 按钮宽度Å
  final Color color; // 按钮背景色
  final Color textColor; // 按钮文本颜色
  final Color borderSideColor; // 边框颜色
  final double borderSideWidth; // 边框宽度
  final VoidCallback onPressed; // 点击回调事件

  Button({
    this.type = _type,
    this.layout = _layout,
    this.text = _text,
    this.height,
    this.width,
    this.color = _color,
    this.textColor = Colors.white,
    this.borderSideColor = const Color(0xFF000000),
    this.borderSideWidth = 1.0,
    this.onPressed,
  });

  Widget _getButton() {
    Map<String, MaterialButton> _btn = {
      "raised": RaisedButton(
        child: Text('${this.text}'),
        color: this.color,
        textColor: this.textColor,
        onPressed: this.onPressed,
      ),
      "outline": OutlineButton(
        child: Text('${this.text}'),
        color: this.color,
        textColor: this.textColor,
        borderSide: BorderSide(
          color: this.borderSideColor,
          width: this.borderSideWidth,
        ),
        onPressed: this.onPressed,
      ),
    };
    return _btn[this.type];
  }

  Widget _getLayout() {
    Map _lay = {
      "base": Container(
        height: this.height,
        width: this.width,
        child: this._getButton(),
      ),
      "row": Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: this.height,
              margin: EdgeInsets.all(8),
              child: this._getButton(),
            ),
          )
        ],
      ),
    };
    return _lay[this.layout];
  }

  @override
  Widget build(BuildContext context) {
    return this._getLayout();
  }
}
