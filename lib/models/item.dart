// import 'package:dbutils/sqllitedb.dart';
// import 'package:sqflite/sqflite.dart';

// import 'package:thizerlist/application.dart';

// class Item extends DBInterface {

//   static Item _this;

//   Item.getInstance() : super();

//   factory Item() {
//     if (_this == null) {
//       _this = Item.getInstance();
//     }
//     return _this;
//   }

//   @override
//   String get name => dbName;

//   @override
//   int get version => dbVersion;

//   @override
//   Future onCreate(Database db, int version) {
//     // Never will get here... All databases must to be created on lista.dart model file
//   }

//   Future<bool> save() async {
//     var rec = await saveRec('item');
//     return rec.isNotEmpty;
//   }

//   Future<List<Map>> getItems(int pkLista) async {
//     return await this.query(
//       'item', [],
//       where: 'fk_lista = ?',
//       whereArgs: [pkLista]
//     );
//   }

// }