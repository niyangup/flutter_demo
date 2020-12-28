class InfoDetailResultModel {
  String msg;
  int code;
  InfoDetailModel data;

  InfoDetailResultModel({this.msg, this.code, this.data});

  InfoDetailResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'] != null
        ? new InfoDetailModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class InfoDetailModel {
  String id;
  String name;
  String content;
  String img;
  String video;
  String type;
  int giveLike;
  int commentNum;
  String province;
  String city;
  String area;
  String url;
  String state;
  String createTime;
  String updateTime;
  String giveLikeState;

  InfoDetailModel(
      {this.id,
      this.name,
      this.content,
      this.img,
      this.video,
      this.type,
      this.giveLike,
      this.commentNum,
      this.province,
      this.city,
      this.area,
      this.url,
      this.state,
      this.createTime,
      this.updateTime,
      this.giveLikeState});

  InfoDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    img = json['img'];
    video = json['video'];
    type = json['type'];
    giveLike = json['giveLike'];
    commentNum = json['commentNum'];
    province = json['province'];
    city = json['city'];
    area = json['area'];
    url = json['url'];
    state = json['state'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    giveLikeState = json['giveLikeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['img'] = this.img;
    data['video'] = this.video;
    data['type'] = this.type;
    data['giveLike'] = this.giveLike;
    data['commentNum'] = this.commentNum;
    data['province'] = this.province;
    data['city'] = this.city;
    data['area'] = this.area;
    data['url'] = this.url;
    data['state'] = this.state;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['giveLikeState'] = this.giveLikeState;
    return data;
  }
}
