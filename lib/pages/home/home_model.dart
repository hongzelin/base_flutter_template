/*
 * Author: lin.zehong 
 * Date: 2020-07-21 22:18:47 
 * Desc: model 数据
 */
class HomeModel {
  List<Data> data;
  int errCode;
  String errMsg;
  int totalCount;
  int totalPage;

  HomeModel(
      {this.data, this.errCode, this.errMsg, this.totalCount, this.totalPage});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    totalCount = json['totalCount'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['errCode'] = this.errCode;
    data['errMsg'] = this.errMsg;
    data['totalCount'] = this.totalCount;
    data['totalPage'] = this.totalPage;
    return data;
  }
}

class Data {
  int newsId;
  String releaseTime;
  String title;
  int type;

  Data({this.newsId, this.releaseTime, this.title, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    newsId = json['newsId'];
    releaseTime = json['releaseTime'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newsId'] = this.newsId;
    data['releaseTime'] = this.releaseTime;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}
