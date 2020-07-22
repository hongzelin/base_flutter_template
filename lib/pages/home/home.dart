/*
 * Author: lin.zehong 
 * Date: 2020-07-22 17:42:07 
 * Desc: home 页面
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import './home_view_model.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;
  HomePage(this.viewModel, {Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(this.viewModel);
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel viewModel;
  _HomePageState(this.viewModel);

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  int _page = 1;

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
      Map<String, dynamic> queryParameters = {
        "pageNum": this._page,
        "pageSize": 10,
        "type": "1",
      };
      var res = viewModel.getList(context, queryParameters);
      res.then((value) {
        // 没有更多数据
        if (type == 'load' && !value['hasMore']) {
          _refreshController.loadNoData();
        }
      });
      this.setState(() {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    if (viewModel.list.length == 0) {
      this._getData("refresh");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SmartRefresher(
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
          itemCount: viewModel.list.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                InkWell(
                  child: ListTile(
                    title: Text(
                      "${index} - ${viewModel.list[index].title}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/add",
                        arguments: {"newsId": viewModel.list[index].newsId});
                  },
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
