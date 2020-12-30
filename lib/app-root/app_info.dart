import 'package:package_info/package_info.dart';

abstract class AppInfo {
  static PackageInfo _packageInfo;
  static String get appName => _packageInfo.appName;
  static String get packageName => _packageInfo.packageName;
  static String get version => _packageInfo.version;
  static String get buildNumber => _packageInfo.buildNumber;

  static Future init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }
}
