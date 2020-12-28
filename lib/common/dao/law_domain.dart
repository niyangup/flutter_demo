class LawDomain {
  ///id
  int id;

  ///法律法规id
  String lawId;

  ///图片url
  String imgUrl;

  ///item标题
  String title;

  ///阅读状态
  String readState;

  ///item类型
  String type;

  ///item编号
  String number;

  ///文件url
  String fileUrl;

  ///文件名称
  String fileName;

  ///备用字段
  String finalRow;

  LawDomain(
      {this.id,
      this.lawId,
      this.imgUrl,
      this.title,
      this.readState,
      this.type,
      this.number,
      this.fileUrl,
      this.fileName,
      this.finalRow});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'lawId': lawId,
      'imgUrl': imgUrl,
      'title': title,
      'readState': readState,
      'type': type,
      'number': number,
      'fileUrl': fileUrl,
      'fileName': fileName,
      'finalRow': finalRow,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  LawDomain.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    lawId = map['lawId'];
    imgUrl = map['imgUrl'];
    title = map['title'];
    readState = map['readState'];
    type = map['type'];
    number = map['number'];
    fileUrl = map['fileUrl'];
    fileName = map['fileName'];
    finalRow = map['finalRow'];
  }

  @override
  String toString() {
    return 'LawDomain{id: $id, lawId: $lawId, imgUrl: $imgUrl, title: $title, readState: $readState, type: $type, number: $number, fileUrl: $fileUrl, fileName: $fileName, finalRow: $finalRow}';
  }
}
