import 'package:projeto_1/domain/entities/client_entity.dart';

//repository contract
abstract class GetClientByEmailPasswordRepository {
  Future<ClientEntity?> call(String email, String password);
}
