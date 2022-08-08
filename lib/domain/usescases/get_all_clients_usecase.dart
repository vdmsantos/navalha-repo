import 'package:projeto_1/domain/entities/client_entity.dart';

abstract class GetAllClientsUsecase {
  List<ClientEntity> call();
}
