import 'package:projeto_1/domain/entities/client_entity.dart';
import 'package:projeto_1/domain/repositories/get_client_by_email_password_repository.dart';

//use case contract
abstract class GetClientByEmailPasswordUseCase {
  Future<ClientEntity?> call(String email, String password);
}

class GetClientByEmailPasswordUsecaseImp
    implements GetClientByEmailPasswordUseCase {
  final GetClientByEmailPasswordRepository _repository;
  GetClientByEmailPasswordUsecaseImp(this._repository);

  @override
  Future<ClientEntity?> call(String email, String password) async {
    return await _repository.call(email, password);
  }
}
