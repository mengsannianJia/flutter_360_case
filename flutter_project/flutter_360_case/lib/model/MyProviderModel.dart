import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../domain/repository.dart';

class MyProviderModel extends ChangeNotifier {
  final SettingButtonSwitchRepository _useCase = GetIt.instance<SettingButtonSwitchRepository>();

  bool _status = false;

  bool get status => _status;

  MyProviderModel() {
    getPirSwitch();
  }

  Future<void> getPirSwitch() async {
    notifyListeners();
    try {
      _status = (await _useCase.getPirSwitch())!;
    } catch (e) {
      // Handle error
    } finally {
      notifyListeners();
    }
  }

  Future<void> setStatus(bool value) async {
    _status = value;
    notifyListeners();

    try {
      await _useCase.setPirSwitch(value);
    } catch (e) {
      _status = (await _useCase.getPirSwitch())!;
    } finally {
      notifyListeners();
    }
  }
}
