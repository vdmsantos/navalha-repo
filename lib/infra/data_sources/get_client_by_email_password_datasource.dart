import 'package:projeto_1/domain/entities/client_entity.dart';

abstract class GetClientByEmailPasswordDatasource {
  Future<ClientEntity?> call(String email, String password);
}
