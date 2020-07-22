/*
 * Author: lin.zehong 
 * Date: 2020-07-21 22:11:31 
 * Desc: 全局 view model
 */
import 'package:flutter/material.dart';

// 1 创建 Provider，需要继承 ChangeNotifier
class GlobalViewModel with ChangeNotifier {
  List _cartList = []; // 状态

  int get cartNum => this._cartList.length;
  List get cartList => this._cartList;

  addData(value) {
    this._cartList.add(value);
    notifyListeners();
  }

  deleteData(value) {
    this._cartList.remove(value);
    notifyListeners();
  }
}
