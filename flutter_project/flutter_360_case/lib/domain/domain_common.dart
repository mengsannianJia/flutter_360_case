
import 'package:get_it/get_it.dart';

import '../BLL/SettingRelatedBusiness.dart';
import '../data_service/dataService.dart';

class DomainCommon {
  static void init() {
    GetIt.instance.registerLazySingleton<SettingRelatedBusiness>(() => SettingRelatedBusiness());
    GetIt.instance.registerLazySingleton<DataService>(() => DataService());
  }
}

