class CommentResultModel {
  String msg;
  int code;
  List<CommentModel> data;

  CommentResultModel({this.msg, this.code, this.data});

  CommentResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<CommentModel>();
      json['data'].forEach((v) {
        data.add(new CommentModel.fromJson(v));
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

class CommentModel {
  String id;
  String articleId;
  String commentsUserId;
  String content;
  String replyContent;
  String type;
  String createTime;

  CommentModel(
      {this.id,
      this.articleId,
      this.commentsUserId,
      this.content,
      this.replyContent,
      this.type,
      this.createTime});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleId = json['articleId'];
    commentsUserId = json['commentsUserId'];
    content = json['content'];
    replyContent = json['replyContent'];
    type = json['type'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleId'] = this.articleId;
    data['commentsUserId'] = this.commentsUserId;
    data['content'] = this.content;
    data['replyContent'] = this.replyContent;
    data['type'] = this.type;
    data['createTime'] = this.createTime;
    return data;
  }
}
