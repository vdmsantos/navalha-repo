// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:projeto_1/domain/entities/client_entity.dart';
import 'package:projeto_1/domain/usescases/get_client_by_email_password_usecase.dart';
import 'package:projeto_1/infra/model/adress_model.dart';
import 'package:projeto_1/infra/repositories/get_client_adress_by_cep.dart';

class ClientControler {
  final GetClientByEmailPasswordUseCase _getClientByEmailPasswordUseCase;
  final GetClientAdressByCep _adressRepository;

  ClientControler(
    this._getClientByEmailPasswordUseCase,
    this._adressRepository,
  );

  late ClientEntity? client;

  Future<void> getClientByEmailPassword(String email, String password) async {
    client = await _getClientByEmailPasswordUseCase.call(email, password);
  }

  Future<AdressModel?> getClientAdress() async {
    return await _adressRepository.getClientAdress(client!.cep);
  }

  bool isNull() {
    if (client == null) {
      return true;
    } else {
      return false;
    }
  }
}
