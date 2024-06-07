

class SettingButtonModel {
  final bool buttonStatus;

  SettingButtonModel({required this.buttonStatus});

  factory SettingButtonModel.fromJson(Map<String, dynamic> json) {
    return SettingButtonModel(
      buttonStatus: json['buttonStatus'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buttonStatus': buttonStatus,
    };
  }
}
