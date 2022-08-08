import 'package:get_it/get_it.dart';
import 'package:projeto_1/infra/model/user_model.dart';

import '../../infra/data_sources_deprecated/data_source.dart';

class LoginController {
  var daofactory = DataAccess();
  Future<bool> validLogin(String email, String password) async {
    if (await daofactory.clientdao.isRegistered(email, password)) {
      UsuarioModel? userModel =
          await daofactory.clientdao.getClientObj(email, password);

      if (GetIt.I.isRegistered<UsuarioModel>()) {
        GetIt.I
            .reset()
            .whenComplete(() => GetIt.I.registerSingleton(userModel!));
      } else {
        GetIt.I.registerSingleton(userModel!);
      }

      return true;
    } else {
      return false;
    }
  }
}
