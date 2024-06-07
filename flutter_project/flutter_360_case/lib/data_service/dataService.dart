import 'dart:convert';

import 'package:async/async.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

import '../Utils/CacheStrategy.dart';
import '../http/NetworkService.dart';
import 'cache_manager.dart';

final _logger = Logger("DataService");

class DataService {
  final NetworkService http = NetworkService();

  // 获取按钮状态
  // Future<bool?> getPirSwitch({CacheStrategy cacheStrategy = CacheStrategy.cacheOverRemote}) async {
  //   return processCacheStrategy<bool?>(cacheStrategy,
  //     localDataGetter: getPirSwitchLocal,
  //     remoteDataGetter: getPirSwitchRemote,
  //     localDataSaver:
  //   );
  // }

  // 设置按钮状态
  Future<void> setPirSwitch(bool switchOn) async {
    // 并行执行远程设置和本地保存
    await Future.wait([
      setPirSwitchRemote(switchOn),
      setPirSwitchLocal(switchOn),
    ]);
  }

  // 从本地缓存获取按钮状态
  Future<bool?> getPirSwitchLocal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('pir_switch');
  }

  // 将按钮状态保存到本地缓存
  Future<void> setPirSwitchLocal(bool switchOn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('pir_switch', switchOn);
  }

  // 从远程服务器获取按钮状态
  Future<bool?> getPirSwitchRemote() async {
    try {
      final response = await http.post('m1/4547034-4195117-default/buttonStatue');
      final responseData = jsonDecode(response.data);
      // 确保返回的数据类型是布尔值
      if (responseData is bool) {
        return responseData;
      } else {
        print('错误：未能正确获取按钮状态');
        return null;
      }
    } catch (error) {
      print('获取按钮状态失败：$error');
      return null;
    }
  }

  // 将按钮状态设置到远程服务器
  Future<void> setPirSwitchRemote(bool switchOn) async {
    // 实现设置按钮状态到远程服务器的逻辑
  }
}


// Future<R> processCacheStrategy<R>(
//   CacheStrategy? cacheStrategy, {
//   required Future<R?> localDataGetter(),
//   required Future<void> localDataSaver(R result),
//   required Future<R> remoteDataGetter(),
//   }) async {
//     cacheStrategy ??= CacheStrategy.cacheOverRemote;
//     switch (cacheStrategy) {
//     // case CacheStrategy.cacheOnly:
//     final cache = await localDataGetter.call();
//     if (cache != null) {
//     return cache;
//     }
//     // throw NoCachedException();
//     case CacheStrategy.remoteOnly:
//     final result = await remoteDataGetter.call();
//     await localDataSaver.call(result);
//     return result;
//     case CacheStrategy.cacheOverRemote:
//     final cache = await localDataGetter.call();
//     if (cache != null) {
//     return cache;
//     }
//   final result = await remoteDataGetter.call();
//   await localDataSaver.call(result);
//   return result;
//   }
// }