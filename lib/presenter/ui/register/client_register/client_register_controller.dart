// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../infra/data_sources_deprecated/data_source.dart';
import '../../../../infra/model/user_model.dart';

class ClientRegisterController {
  var daofactory = DataAccess();
  final Map<String, dynamic> userParams = {
    'id': null,
    'name': null,
    'email': null,
    'password': null,
    'cpf': null,
    'cep': null
  };

  bool validEmail(String email) {
    void setEmailParam() {
      userParams['email'] = email;
    }

    setEmailParam();
    return true;
  }

  bool validName(String name) {
    void setNameParam() {
      userParams['name'] = name;
    }

    setNameParam();
    return true;
  }

  bool validPassword(String password) {
    void setPasswordParam() {
      userParams['password'] = password;
    }

    setPasswordParam();
    insertClient();
    return true;
  }

  bool validCpf(String cpf) {
    void setCpfParam() {
      userParams['cpf'] = cpf;
    }

    setCpfParam();
    return true;
  }

  bool validCep(String cep) {
    void setCepParam() {
      userParams['cep'] = cep;
    }

    setCepParam();
    return true;
  }

  void insertClient() {
    var userModel = UsuarioModel(
      userParams['name'],
      userParams['email'],
      userParams['password'],
      userParams['cpf'],
      userParams['cep'],
    );

    daofactory.clientdao.insert(userModel);
    daofactory.clientdao.select();
  }
  //inserir usuario

}
