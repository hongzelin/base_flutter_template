/*
 * Author: lin.zehong 
 * Date: 2020-07-21 22:19:02 
 * Desc: viewmodel provider 相关处理
 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './home_api.dart';
import './home_model.dart';

// 1 创建 Provider，需要继承 ChangeNotifier
class HomeViewModel with ChangeNotifier {
  List _list = [];
  HomeViewModel() {
    // 构造函数可以初始化数据
    this._list = [];
  }
  List get list => _list; // 获取状态

  // 获取数据
  Future getList(
    BuildContext context,
    Map<String, dynamic> queryParameters,
  ) async {
    Response response = await HomeApi.getList(context, queryParameters);
    HomeModel hm = HomeModel.fromJson(response.data);
    if (hm.data.length == 0) {
      return {"hasMore": false};
    }
    this._list.addAll(hm.data);
    notifyListeners(); // 通知状态更新
    return {"hasMore": true};
  }
}
