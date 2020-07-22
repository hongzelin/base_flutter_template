/*
 * Author: lin.zehong 
 * Date: 2020-07-05 11:36:41 
 * Desc: 下拉刷新 上拉分页加载更多 
 */
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshPage extends StatefulWidget {
  String api;
  Map query;
  PullToRefreshPage(this.api, {Key key, this.query}) : super(key: key);

  _PullToRefreshPageState createState() =>
      _PullToRefreshPageState(this.api, query: this.query);
}

class _PullToRefreshPageState extends State<PullToRefreshPage> {
  String api;
  Map query;
  _PullToRefreshPageState(this.api, {this.query});

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List list = [];
  int _page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData("refresh");
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      print('_onRefresh --- 请求数据完成');
      this._getData("refresh");
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      this._getData("load");
    });
    _refreshController.loadComplete();
  }

  void _getData(type) async {
    try {
      Response response = await Dio().get(
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}",
      );
      var res = json.decode(response.data)['result'];
      // print(res);

      // 没有更多数据
      if (type == 'load' && res.length == 0) {
        _refreshController.loadNoData();
      }
      this.setState(() {
        this.list.addAll(res); // 拼接
        this._page++;
      });
    } catch (e) {
      if (type == "refresh") {
        // 更新失败
        _refreshController.refreshFailed();
      } else if (type == "load") {
        // 加载失败
        _refreshController.loadFailed();
      }
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("上拉加载");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("加载失败！点击重试！");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("松手,加载更多!");
          } else {
            body = Text("没有更多数据了!");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemCount: this.list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  this.list[index]['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
