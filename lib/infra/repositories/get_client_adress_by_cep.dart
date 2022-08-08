import 'package:dio/dio.dart';
import 'package:projeto_1/infra/model/adress_model.dart';

class GetClientAdressByCep {
  final Dio dio;

  GetClientAdressByCep({
    required this.dio,
  });

  late AdressModel adress;

  Future<AdressModel> getClientAdress(String cep) async {
    try {
      var url = 'https://viacep.com.br/ws/$cep/json/';
      final response = await dio.get(url);

      adress = AdressModel.fromMap(response.data);
    } catch (e) {
      print('Deu erro $e');
    }
    return adress;
  }
}
