import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsuarioModel {
  final String? _name;
  final String? _email;
  final String? _password;
  final String? _cpf;
  final String? _cep;
// senha

  String? get userName {
    return _name;
  }

  String? get userEmail {
    return _email;
  }

  String? get userPassword {
    return _password;
  }

  String? get userCpf {
    return _cpf;
  }

  String? get userCep {
    return _cep;
  }

  UsuarioModel(
    this._name,
    this._email,
    this._password,
    this._cpf,
    this._cep,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_name': _name,
      '_email': _email,
      '_password': _password,
      '_cpf': _cpf,
      '_cep': _cep,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UsuarioModel(_name: $_name, _email: $_email, _password: $_password, _cpf: $_cpf, _cep: $_cep)';
  }
}
