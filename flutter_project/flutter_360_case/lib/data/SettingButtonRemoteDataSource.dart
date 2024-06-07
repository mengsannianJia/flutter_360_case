

abstract class SettingButtonRemoteDataSource {
  Future<SettingButtonPropertiesData> getProperties();

  Future<void> setProperty({
    required String buttonStatue,
  });
}

abstract class SettingButtonRemoteDataSourceForCellularNet extends SettingButtonRemoteDataSource {}


class SettingButtonPropertiesData {
  final bool buttonStatue;

  SettingButtonPropertiesData(this.buttonStatue);

  Map<String, dynamic> toJson() => <String, dynamic>{
    "buttonStatue": buttonStatue
  };
}