/*
 * Author: lin.zehong 
 * Date: 2020-07-05 13:17:15 
 * Desc: loading 效果 
 */
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  final String loadingText;
  final bool outsideDismiss;
  final Function dismissDialog;

  LoadingPage({
    Key key,
    this.loadingText = "loading...",
    this.outsideDismiss = true,
    this.dismissDialog,
  }) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    if (widget.dismissDialog != null) {
      // 将关闭 Loading 的方法传递到调用的页面.
      widget.dismissDialog(() {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.outsideDismiss ? _dismissLoading : null,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: new SizedBox(
            width: 120.0,
            height: 120.0,
            child: new Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                //  color: dataUtils.getIsDarkMode() ? Colours.dark_unselected_item_color : Colors.white ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SpinKitWave(
                          color: Theme.of(context).primaryColor,
                          type: SpinKitWaveType.start),
                    ],
                  ),
                  Padding(
                    child: Text(widget.loadingText,
                        style:
                            TextStyle(color: Colors.black54, fontSize: 10.0)),
                    padding: EdgeInsets.all(15.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //关闭 loading
  _dismissLoading() {
    Navigator.of(context).pop();
  }
}
