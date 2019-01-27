import 'package:dbutils/sqllitedb.dart';
import 'package:sqflite/sqflite.dart';

import 'package:thizerlist/application.dart';

class Lista extends DBInterface {

  static Lista _this;

  Lista.getInstance() : super();

  factory Lista() {
    if (_this == null) {
      _this = Lista.getInstance();
    }
    return _this;
  }

  /// Nome do banco de dados
  @override
  String get name => dbName;

  @override
  int get version => dbVersion;

  @override
  Future onCreate(Database db, int version) async {
    
    // Datetime Format = YYYY-MM-DD HH:MM:SS.SSS
    db.execute("""
      CREATE TABLE lista (
        pk_lista INTEGER PRIMARY KEY,
        name TEXT,
        created TEXT
      )
    """);

    // db.insert('lista', {
    //   'name': 'Teste numero 1',
    //   'created': DateTime.now().toString()
    // });

    // db.execute("""
    //   CREATE TABLE item (
    //     pk_item INTEGER PRIMARY KEY,
    //     fk_lista INTEGER,
    //     name TEXT,
    //     quantidade INTEGER,
    //     valor DECIMAL(10,2),
    //     created TEXT
    //   )
    // """);
  }

  Future<bool> save() async {
    var rec = await saveRec('lista');
    return rec.isNotEmpty;
  }

  Future<bool> insert(Map<String, dynamic> items) async {
    return await this.saveMap('lista', items);
  }

  Future<List<Map>> getListas() async {
    return await this.rawQuery('SELECT * FROM lista ORDER BY created DESC');
  }

}