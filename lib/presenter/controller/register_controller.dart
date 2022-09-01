import 'package:dio/dio.dart';
import 'package:projeto_1/domain/entities/client_entity.dart';

class RegisterController {
//   {
//   "id": 0,
//   "name": "string",
//   "cep": "string",
//   "email": "string",
//   "password": "string",
//   "adressId": 0,
//   "adress": {
//     "id": 0,
//     "street": "string",
//     "city": "string",
//     "postalCode": 0,
//     "country": "string"
//   }
// }

  final Dio dio = Dio();

  Future<String> addClient(ClientModel user) async {
    var data = {
      "id": 0,
      "name": user.name,
      "cep": user.cep,
      "email": user.email,
      "password": user.password,
      "adressId": 1
    };
    final response = await dio.post(
      'http://zuplae.vps-kinghost.net:8084/api/Client',
      data: data,
    );

    return response.data;
  }
}
