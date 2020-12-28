class SearchHistoryResultModel {
  String msg;
  int code;
  List<SearchHistoryModel> data;

  SearchHistoryResultModel({this.msg, this.code, this.data});

  SearchHistoryResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<SearchHistoryModel>();
      json['data'].forEach((v) {
        data.add(new SearchHistoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchHistoryModel {
  String id;
  String userId;
  String name;
  String createTime;

  SearchHistoryModel({this.id, this.userId, this.name, this.createTime});

  SearchHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['createTime'] = this.createTime;
    return data;
  }
}
