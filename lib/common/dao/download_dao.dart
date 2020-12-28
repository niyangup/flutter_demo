import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'folder_domain.dart';
import 'law_domain.dart';

/// 使用前需要在Global中初始化数据库
/// `await DBUtil().initDB();`
class DBUtil {
  ///表名
  static const String _TABLE_NAME_LAW = 'law_list';
  static const String _TABLE_NAME_FOLDER = 'folder_list';

  static DBUtil _instance = DBUtil._internal();

  factory DBUtil() => _instance;

  DBUtil._internal();

  Database _db;

  initDB() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'law_database.db'),
      onCreate: (db, version) {
        print('数据库初始化完成');
        db.execute(""" 
        CREATE TABLE $_TABLE_NAME_FOLDER (
           id INTEGER PRIMARY KEY,
           title text,
           folder text
        )
        """);
        db.execute("""
        INSERT INTO $_TABLE_NAME_FOLDER(id,title)  VALUES(1,'默认文件夹');
        """);
        db.execute('''
          CREATE TABLE $_TABLE_NAME_LAW (
              id INTEGER PRIMARY KEY,
              imgUrl TEXT,
              title text,
              readState text,
              type text,
              number text,
              fileUrl text,
              fileName text,
              finalRow text,
              lawId text
          );
          ''');
        return db;
      },
      version: 2,
      onUpgrade: (Database db, int oldVersion, int newVersion) {
        switch (newVersion) {
          case 2:
            db.execute(""" 
                  CREATE TABLE $_TABLE_NAME_FOLDER (
                     id INTEGER PRIMARY KEY,
                     title text,
                     folder text
                  ) 
            """);
            db.execute(""" 
              INSERT INTO $_TABLE_NAME_FOLDER(id,title)  VALUES(1,'默认文件夹');
              """);
            db.execute("""
            UPDATE law_list SET finalRow='1';
            """);
            break;
        }
      },
    );
  }

  ///插入数据
  Future<LawDomain> insert(LawDomain lawDomain) async {
    lawDomain.id = await _db.insert(_TABLE_NAME_LAW, lawDomain.toMap());
    return lawDomain;
  }

  ///根据id获取实体
  Future<LawDomain> getLawDomainById(int id) async {
    List<Map> maps = await _db.rawQuery(" select * from $_TABLE_NAME_LAW where id = $id ");
    if (maps.length > 0) {
      return LawDomain.fromMap(maps.first);
    }
    return null;
  }

  ///根据id删除实体
  Future<int> deleteLawDomainById(int id) async {
    int count = await _db.rawDelete("delete from $_TABLE_NAME_LAW where id = $id");
    return count == null ? 0 : count;
  }

  ///根据法律法规id获取实体
  Future<LawDomain> getLawDomainByLawId(int lawId) async {
    List<Map> maps = await _db.rawQuery(" select * from $_TABLE_NAME_LAW where lawId = $lawId ");
    if (maps.length > 0) {
      return LawDomain.fromMap(maps.first);
    }
    return null;
  }

  ///根据文件夹id获取法律法规实体
  Future<LawDomain> getLawDomainByFolderId(int folderId) async {
    List<Map> maps =
        await _db.rawQuery(" select * from $_TABLE_NAME_LAW where finalRow = $folderId ");
    if (maps.length > 0) {
      return LawDomain.fromMap(maps.first);
    }
    return null;
  }

  ///根据文件夹id查询所有的法律法规实体
  Future<List<LawDomain>> getAllLawDomainByFolderId(int folderId) async {
    List<LawDomain> result = [];
    List<Map> maps = await _db
        .rawQuery(" select * from $_TABLE_NAME_LAW  where finalRow = $folderId ORDER BY id desc");
    if (maps.isNotEmpty) {
      for (var m in maps) {
        result.add(LawDomain.fromMap(m));
      }
    }
    print(maps);
    return result;
  }

  ///获取所有的实体
  Future<List<LawDomain>> getAllLawDomain() async {
    List<LawDomain> result = [];
    List<Map> maps = await _db.rawQuery(" select * from $_TABLE_NAME_LAW ORDER BY id desc");
    if (maps.isNotEmpty) {
      for (var m in maps) {
        result.add(LawDomain.fromMap(m));
      }
    }
    print(maps);
    return result;
  }

  ///模糊查询name
  Future<List<LawDomain>> getLawDomainByName(String name) async {
    List<LawDomain> result = [];
    List<Map> maps =
        await _db.rawQuery(" SELECT * from $_TABLE_NAME_LAW where title like '%$name%' ");
    if (maps.isNotEmpty) {
      for (var m in maps) {
        result.add(LawDomain.fromMap(m));
      }
    }
    print(maps);
    return result;
  }

  ///根据id修改已读状态
  Future<int> updateReadStateById(int lawId) async {
    var row = await _db
        .rawUpdate("update $_TABLE_NAME_LAW set readState = '已读' where lawId = ? ", [lawId]);
    print(row);
    return row;
  }

  ///获取所有的文件夹表明
  Future<List<FolderDomain>> getAllFolderNames() async {
    List<FolderDomain> result = [];
    List<Map> maps = await _db.rawQuery(" SELECT * from $_TABLE_NAME_FOLDER");
    if (maps.isNotEmpty) {
      for (var m in maps) {
        result.add(FolderDomain.fromMap(m));
      }
    }
    print(maps);
    return result;
  }

  ///插入文件夹信息
  Future<FolderDomain> insertFolderDomain(FolderDomain folderDomain) async {
    folderDomain.id = await _db.insert(_TABLE_NAME_FOLDER, folderDomain.toMap());
    print(folderDomain);
    return folderDomain;
  }

  ///根据文件夹id获取实体
  Future<FolderDomain> getFolderDomainByLawId(int folderId) async {
    List<Map> maps = await _db.rawQuery(" select * from $_TABLE_NAME_FOLDER where id = $folderId ");
    if (maps.length > 0) {
      return FolderDomain.fromMap(maps.first);
    }
    return null;
  }

  ///根据id修改文件夹名称
  Future<int> updateFolderNameById(int folderId, String newName) async {
    var row = await _db
        .rawUpdate("update $_TABLE_NAME_FOLDER set title = ? where id = ? ", [newName, folderId]);
    print(row);
    return row;
  }
}
