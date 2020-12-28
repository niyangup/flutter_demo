class CommentListResultModel {
  String msg;
  int code;
  List<CommentListModel> data;

  CommentListResultModel({this.msg, this.code, this.data});

  CommentListResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<CommentListModel>();
      json['data'].forEach((v) {
        data.add(new CommentListModel.fromJson(v));
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

class CommentListModel {
  String id;
  String articleId;
  String articleName;
  String commentsUserId;
  String content;
  String replyContent;
  String type;
  String createTime;
  String portrait;
  String level;
  String userName;

  CommentListModel(
      {this.id,
      this.articleId,
      this.articleName,
      this.commentsUserId,
      this.content,
      this.replyContent,
      this.type,
      this.createTime,
      this.portrait,
      this.level,
      this.userName});

  CommentListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleId = json['articleId'];
    articleName = json['articleName'];
    commentsUserId = json['commentsUserId'];
    content = json['content'];
    replyContent = json['replyContent'];
    type = json['type'];
    createTime = json['createTime'];
    portrait = json['portrait'];
    level = json['level'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleId'] = this.articleId;
    data['articleName'] = this.articleName;
    data['commentsUserId'] = this.commentsUserId;
    data['content'] = this.content;
    data['replyContent'] = this.replyContent;
    data['type'] = this.type;
    data['createTime'] = this.createTime;
    data['portrait'] = this.portrait;
    data['level'] = this.level;
    data['userName'] = this.userName;
    return data;
  }
}
