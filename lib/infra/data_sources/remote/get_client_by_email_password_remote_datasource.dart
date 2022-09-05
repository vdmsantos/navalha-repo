import 'package:dio/dio.dart';
import 'package:projeto_1/domain/entities/client_entity.dart';
import 'package:projeto_1/infra/data_sources/get_client_by_email_password_datasource.dart';
import 'package:sqflite/sqflite.dart';

class GetClientByEmailPasswordLocalDatasource
    implements GetClientByEmailPasswordDatasource {
  late Database database;

  GetClientByEmailPasswordLocalDatasource();

  @override
  Future<ClientEntity?> call(String email, String password) async {
    ClientEntity? client;

    await getClientObj(email, password).then((value) {
      client = value;
    });

    return client;
  }

  Future<ClientEntity?> getClientObj(String email, String password) async {
    Dio dio = Dio();
    var body = {"email": email, "password": password};

    final response = await dio.post(
        "http://zuplae.vps-kinghost.net:8084/api/Acces/Logon",
        data: body);

    if (response.data != '') {
      ClientEntity clientModel = ClientEntity(
          id: response.data["id"],
          name: response.data["name"],
          // vitor - gambi pois traz o password criptografado -  password: response.data["password"],
          password: password,
          email: response.data["email"],
          cep: response.data["cep"]);
      return clientModel;
    } else {
      return null;
    }
  }
}
