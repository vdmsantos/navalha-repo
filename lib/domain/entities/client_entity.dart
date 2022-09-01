// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClientEntity {
  final int id;
  final String name;
  final String password;
  final String email;
  final String cep;

  ClientEntity({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.cep,
  });
}

class ClientModel {
  int? id;
  String? name;
  String? password;
  String? email;
  String? cep;
}
