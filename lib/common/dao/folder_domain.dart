class FolderDomain {
  ///id
  int id;

  ///文件夹名字
  String title;

  ///备用字段
  String folder;

  FolderDomain({this.id, this.title, this.folder});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'folder': folder,
      'title': title,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  FolderDomain.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    folder = map['folder'];
  }

  @override
  String toString() {
    return 'FolderDomain{id: $id, title: $title, folder: $folder}';
  }
}
