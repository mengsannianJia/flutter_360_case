
import 'package:flutter_360_case/base/cache_strategy.dart';
import 'package:flutter_360_case/domain/repository.dart';
import 'package:get_it/get_it.dart';
import '../BLL/SettingRelatedBusiness.dart';
import '../data_service/dataService.dart';

class SettingButtonSwitchRepositoryImpl implements SettingButtonSwitchRepository {
  final DataService dataService = GetIt.instance<DataService>();

  @override
  Future<bool> getPirSwitch({CacheStrategy cacheStrategy = CacheStrategy.cacheOverRemote}) {
    // TODO: implement getPirSwitch
    throw UnimplementedError();
  }

  @override
  Future<void> setPirSwitch(bool switchOn) {
    // TODO: implement setPirSwitch
    throw UnimplementedError();
  }

  // @override
  // Future<bool> getPirSwitch({CacheStrategy cacheStrategy = CacheStrategy.cacheOverRemote}) async {
  //   var properties = (await dataService.getPirSwitch(cacheStrategy: cacheStrategy))!;
  //   return properties;
  // }
  //
  // @override
  // Future<void> setPirSwitch(bool switchOn) async {
  //   return await dataService.setPirSwitch(switchOn);
  // }
}