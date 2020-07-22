/*
 * Author: lin.zehong 
 * Date: 2020-07-21 21:13:53 
 * Desc: 底部 Tabs
 */
import 'package:flutter/material.dart';
import '../utils/tools.dart';
import '../pages/home/home_view.dart'; // 首页
import '../pages/add/add_view.dart';
import '../pages/mine/mine_view.dart'; // 我的

class TabsPage extends StatefulWidget {
  final int index;
  TabsPage({Key key, this.index = 0}) : super(key: key);
  @override
  _TabsPageState createState() => _TabsPageState(this.index);
}

class _TabsPageState extends State<TabsPage> {
  int currentIndex = 0;

  _TabsPageState(index) {
    this.currentIndex = index;
  }

  List listTabs = [
    HomeView(),
    AddView(),
    MineView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 项目基础模板'),
        centerTitle: true,
        backgroundColor: ToolUtils.getThemeColor(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('settings');
            },
          )
        ],
      ),
      floatingActionButton: Container(
        height: 68,
        width: 68,
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          color: Colors.white,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add, size: 36, color: Colors.white),
          backgroundColor: ToolUtils.getThemeColor(),
          onPressed: () {
            setState(() {
              this.currentIndex = 1;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this.listTabs[this.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.currentIndex,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this.currentIndex = index;
          });
        },
        selectedItemColor: ToolUtils.getThemeColor(),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我的'),
          ),
        ],
      ),
    );
  }
}
