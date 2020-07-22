/*
 * Author: lin.zehong 
 * Date: 2020-07-22 09:01:17 
 * Desc: services Api 
 */
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter_template/utils/request.dart';
import '../../common/api.dart';

class HomeApi {
  // 测试接口
  static const String NEW_LIST = '${Api.BASE_URL}/home/newsList';

  static Future getList(
    BuildContext context,
    Map<String, dynamic> queryParameters,
  ) async {
    Response response = await httpUtils.post(
      NEW_LIST,
      data: queryParameters,
      context: context,
      isAddLoading: true,
    );
    return response;
  }
}
