// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:projeto_1/domain/entities/client_entity.dart';

class ClientModel extends ClientEntity {
  final int id;
  final String name;
  final String password;
  final String email;
  final String cep;
  final String cpf;

  ClientModel(
    this.id,
    this.name,
    this.password,
    this.email,
    this.cep,
    this.cpf,
  ) : super(
          id: id,
          name: name,
          password: password,
          cep: cep,
          email: email,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'cep': cep,
      'cpf': cpf,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      map['id'] as int,
      map['name'] as String,
      map['password'] as String,
      map['email'] as String,
      map['cep'] as String,
      map['cpf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
