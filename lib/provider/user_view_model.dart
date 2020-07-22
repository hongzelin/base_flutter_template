import 'package:flutter/material.dart';

// 1 创建 Provider，需要继承 ChangeNotifier
class UserViewModel with ChangeNotifier {
  int _count = 1; // 状态

  UserViewModel() {
    // 构造函数可以初始化数据
    this._count = 10;
  }

  int get count => _count; // 获取状态

  // 更新状态
  incCount() {
    this._count++;
    notifyListeners(); // 通知状态更新
  }
}
