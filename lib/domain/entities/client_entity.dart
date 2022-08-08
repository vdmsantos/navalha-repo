// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClientEntity {
  final int id;
  final String name;
  final String password;
  final String email;
  final String cep;
  final String cpf;

  ClientEntity({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.cep,
    required this.cpf,
  });
}
