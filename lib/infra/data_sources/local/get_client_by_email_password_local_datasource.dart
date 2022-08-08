import 'package:projeto_1/domain/entities/client_entity.dart';
import 'package:projeto_1/infra/data_sources/get_client_by_email_password_datasource.dart';
import 'package:sqflite/sqflite.dart';

class GetClientByEmailPasswordLocalDatasource
    implements GetClientByEmailPasswordDatasource {
  late Database database;

  GetClientByEmailPasswordLocalDatasource() {
    init();
  }

  @override
  Future<ClientEntity?> call(String email, String password) async {
    //executar metodos que procurar pelo usuário
    ClientEntity? client;
    await getClientObj(email, password).then((value) {
      client = value;
    });
    return client;
  }

  Future<ClientEntity?> getClientObj(String email, String password) async {
    List<Map> list = await database.rawQuery(
        'SELECT * FROM TBCLIENTE WHERE UPPER(EMAIL) = ? AND UPPER(PASSWORD) = ?',
        [email.trim().toUpperCase(), password.trim().toUpperCase()]);

    if (list.isNotEmpty) {
      Map clientMap = list[0];

      ClientEntity clientModel = ClientEntity(
        name: clientMap['name'],
        email: clientMap['email'],
        password: clientMap['password'],
        cpf: clientMap['cpf'],
        cep: clientMap['cep'],
        id: 1,
      );
      print(clientModel.toString());
      return clientModel;
    } else {
      return null;
    }
  }

  void init() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo1.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE TBCLIENTE (id INTEGER PRIMARY KEY ,'
          'name TEXT, email TEXT, password TEXT,cep TEXT,cpf TEXT)',
        );
      },
    );
  }
}
