import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsuarioModel {
  String _name;
  String _email;
  String _password;
  String _datanasc;
  String _cidade;
  String _endereco;

  UsuarioModel(
    this._name,
    this._email,
    this._password,
    this._datanasc,
    this._cidade,
    this._endereco,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_name': _name,
      '_email': _email,
      '_password': _password,
      '_datanasc': _datanasc,
      '_cidade': _cidade,
      '_endereco': _endereco,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      map['_name'] as String,
      map['_email'] as String,
      map['_password'] as String,
      map['_datanasc'] as String,
      map['_cidade'] as String,
      map['_endereco'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UsuarioModel(_name: $_name, _email: $_email, _password: $_password, _datanasc: $_datanasc, _cidade: $_cidade, _endereco: $_endereco)';
  }

  @override
  bool operator ==(covariant UsuarioModel other) {
    if (identical(this, other)) return true;

    return other._name == _name &&
        other._email == _email &&
        other._password == _password &&
        other._datanasc == _datanasc &&
        other._cidade == _cidade &&
        other._endereco == _endereco;
  }

  @override
  int get hashCode {
    return _name.hashCode ^
        _email.hashCode ^
        _password.hashCode ^
        _datanasc.hashCode ^
        _cidade.hashCode ^
        _endereco.hashCode;
  }
}
