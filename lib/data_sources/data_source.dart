import 'package:projeto_1/data_sources/user_data_source.dart';
import 'package:sqflite/sqflite.dart';

class DataAccess {
  late Database database;
  late UserDataAccess userData;

  DataAccess() {
    init();
  }

  void init() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE TBUSUARIO (id INTEGER PRIMARY KEY ,' 
              'name TEXT, email TEXT, senha TEXT,datanasc TEXT,cidade TEXT,endereco TEXT)',
        );
      },
    );
    userData = UserDataAccess(database);
  }
}
