import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLifecycleListener with WidgetsBindingObserver {
  final void Function(AppLifecycleState state) onStateChange;

  AppLifecycleListener({required this.onStateChange}) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    onStateChange(state);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}

class AppLifecycleListenersTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppLifecycleListenersTestState();
}

class AppLifecycleListenersTestState extends State<AppLifecycleListenersTest> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    // 初始化applifecyclellistener类并传递回调
    _listener = AppLifecycleListener(
      onStateChange: _onStateChanged,
    );
  }

  /// 移除 WidgetBinding.instance.removeObserver(_listener);
  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  // Listen to the app lifecycle state changes
  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        _onDetached();
        break;
      case AppLifecycleState.resumed:
        _onResumed();
        break;
      case AppLifecycleState.inactive:
        _onInactive();
        break;
      case AppLifecycleState.paused:
        _onPaused();
        break;
    }
  }

  void _onDetached() {
    print("应用处于 detached state --- 应用即将被销毁");
  }

  void _onResumed() {
    print("应用处于 resumed state --- 可见且活动状态");
  }

  void _onInactive() {
    print("应用处于 inactive state --- 可见但非活动状态");
  }

  void _onPaused() {
    print("App is in paused state --- 应用处于后台");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AppLifecycleListener"),
        ),
        body: Center(
          child: Text("检查控制台是否有生命周期状态更改"),
        ),
      ),
    );
  }
}
