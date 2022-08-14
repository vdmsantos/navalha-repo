import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projeto_1/domain/usescases/get_client_by_email_password_usecase.dart';
import 'package:projeto_1/infra/data_sources/local/get_client_by_email_password_local_datasource.dart';
import 'package:projeto_1/infra/repositories/get_client_adress_by_cep.dart';
import 'package:projeto_1/infra/repositories/get_client_by_email_password_repository_imp.dart';
import 'package:projeto_1/presenter/controller/client_controler.dart';

import '../presenter/controller/current_index_controller.dart';
import '../presenter/controller/dark_mode_controller.dart';
import '../presenter/controller/index_controller.dart';
import '../presenter/controller/selected_service_controller.dart';

final clientProvider = StateProvider<ClientControler>(
  (ref) => ClientControler(
    GetClientByEmailPasswordUsecaseImp(
      GetClientByEmailPasswordRepositoryImp(
        GetClientByEmailPasswordLocalDatasource(),
      ),
    ),
    GetClientAdressByCep(
      dio: Dio(),
    ),
  ),
);

final darkModeProvider = ChangeNotifierProvider(
  (ref) => DarkModeController(),
);

final currentIndexProvider = ChangeNotifierProvider(
  (ref) => CurrentIndexController(),
);

final indexProvider = ChangeNotifierProvider(
  (ref) => IndexController(),
);

final selectedServiceProvider = ChangeNotifierProvider(
  (ref) => SelectedServiceController(),
);
