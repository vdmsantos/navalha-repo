// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:projeto_1/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDataAccess {
  late Map<String, dynamic> userMap;

  final Database database;

  UserDataAccess(
    this.database,
  );

  void insert(UsuarioModel userObj) async {
    userMap = userObj.toMap();

    await database.rawInsert(
        'INSERT INTO TBUSUARIO(id , name, email,senha,datanasc,cidade,endereco)'
        'VALUES(?,?,?,?,?,?,?)',
        [
          299,
          userMap['_name'],
          userMap['_email'],
          userMap['_password'],
          userMap['_datanasc'],
          userMap['_cidade'],
          userMap['_endereco']
        ]);
    print('inserindo ${userMap.toString()}');
  }

  void update() async {
    int count = await database.rawUpdate(
      'UPDATE TDUSUARIO SET  name = ?,email = ?,senha = ?,datanasc = ?,cidade = ?,endereco = ?',
      [
        userMap['_name'],
        userMap['_email'],
        userMap['_password'],
        userMap['_datanasc'],
        userMap['_cidade'],
        userMap['_endereco']
      ],
    );

    print('update ${userMap.toString()}');
  }

  void select() async {
    List<Map> list = await database.rawQuery('SELECT * FROM TBUSUARIO');
    print(list);
  }

  void delete(int id) async {
    await database.rawDelete(
      'DELETE FROM TDUSUARIO WHERE id = ?',
      [id],
    );
    print('deletando id $id');
  }

  void closeDatabase() async {
    await database.close();
  }
}
