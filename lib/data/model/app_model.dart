import 'package:installed_apps/app_info.dart';

class AppData {
  String? name;
  String? icon;
  String? packageName;
  String? versionName;
  String? versionCode;
  String? builtwith;
  String? installedTimestamp;

  AppData(
      {this.name,
      this.icon,
      this.packageName,
      this.versionName,
      this.versionCode,
      this.builtwith,
      this.installedTimestamp});

  AppData.fromJson(AppInfo json) {
    name = json.name;
    icon = json.icon.toString();
    packageName = json.packageName;
    versionName = json.versionName;
    versionCode = json.versionCode.toString();
    builtwith = json.builtWith.toString();
    installedTimestamp = json.installedTimestamp.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    // data['icon'] = icon;
    data['package_name'] = packageName;
    data['version_name'] = versionName;
    data['version_code'] = versionCode;
    data['builtwith'] = builtwith;
    data['installed_timestamp'] = installedTimestamp;
    return data;
  }
}
