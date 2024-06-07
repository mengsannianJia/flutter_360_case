


import '../base/cache_strategy.dart';



abstract class SettingButtonSwitchRepository {
  Future<bool> getPirSwitch({CacheStrategy cacheStrategy = CacheStrategy.cacheOverRemote});
  Future<void> setPirSwitch(bool switchOn);
}



