import 'package:flutter/material.dart';
import 'package:base_flutter_template/utils/tools.dart';

class HomeAdd extends StatelessWidget {
  final Map arguments;

  const HomeAdd({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新增页面"),
        backgroundColor: ToolUtils.getThemeColor(),
        // title: Text("详情${(args as Map)['id']}"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Text("新增页面 ${arguments != null ? arguments['newsId'] : ''}"),
          ],
        ),
      ),
    );
  }
}
