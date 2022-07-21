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
        'INSERT INTO TBCLIENTE(name,email,password,cep,cpf)'
        'VALUES(?,?,?,?,?)',
        [
          // 52,
          userMap['_name'],
          userMap['_email'],
          userMap['_password'],
          userMap['_cep'],
          userMap['_cpf']
        ]);
    print('inserindo ${userMap.toString()}');
  }

  void update() async {
    await database.rawUpdate(
      'UPDATE TBCLIENTE SET  name = ?,email = ?,password = ?,cep = ?,cpf = ?',
      [
        userMap['_name'],
        userMap['_email'],
        userMap['_password'],
        userMap['_cep'],
        userMap['_cpf']
      ],
    );

    print('update ${userMap.toString()}');
  }

  Future<bool> isRegistered(String email, String password) async {
    List<Map> list = await database.rawQuery(
        'SELECT * FROM TBCLIENTE WHERE EMAIL = ? AND PASSWORD = ?',
        [email.toUpperCase(), password.toUpperCase()]);

    if (list.isNotEmpty) {
      print('encontrou o cabloco');
      return true;
    } else {
      print('não encontrou o cabloco');
      return false;
    }
  }

  void select() async {
    List<Map> list = await database.rawQuery('SELECT * FROM TBCLIENTE');
    print('ESSA É A LISTA PORRA $list');
  }

  void delete(int id) async {
    await database.rawDelete(
      'DELETE  FROM TBCLIENTE',
    );
    print('deletando id $id');
  }

  void closeDatabase() async {
    await database.close();
  }
}
