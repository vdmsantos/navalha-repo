import 'package:projeto_1/domain/entities/client_entity.dart';
import 'package:projeto_1/domain/repositories/get_client_by_email_password_repository.dart';
import 'package:projeto_1/infra/data_sources/get_client_by_email_password_datasource.dart';

class GetClientByEmailPasswordRepositoryImp
    implements GetClientByEmailPasswordRepository {
  final GetClientByEmailPasswordDatasource _datasource;

  GetClientByEmailPasswordRepositoryImp(this._datasource);

  @override
  Future<ClientEntity?> call(String email, String password) async {
    return await _datasource.call(email, password);
  }
}
