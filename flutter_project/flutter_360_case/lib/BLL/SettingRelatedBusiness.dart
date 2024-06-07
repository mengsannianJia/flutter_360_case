import 'package:get_it/get_it.dart';

import '../base/cache_strategy.dart';
import '../domain/repository.dart';


class SettingRelatedBusiness {
  late SettingButtonSwitchRepository _repository;

  SettingRelatedBusiness() {
    _repository = createDeviceRepository();
  }

  SettingButtonSwitchRepository createDeviceRepository() {
    return GetIt.instance<SettingButtonSwitchRepository>();
  }


  Future<bool?> getPirSwitch({CacheStrategy cacheStrategy = CacheStrategy.cacheOverRemote}) async {
    try {
      return await _repository.getPirSwitch(cacheStrategy: cacheStrategy);
    } catch (e) {
      // Handle error, maybe log it or return a default value
      print('Error fetching Pir switch status: $e');
      return null;
    }
  }

  Future<void> setPirSwitch(bool switchOn) async {
    try {
      await _repository.setPirSwitch(switchOn);
    } catch (e) {
      // Handle error, maybe log it or show a notification to the user
      print('Error setting Pir switch status: $e');
    }
  }
}


