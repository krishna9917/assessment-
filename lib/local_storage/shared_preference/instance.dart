import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceInstance extends GetxService {
  static SharedPreferenceInstance get to =>
      Get.find<SharedPreferenceInstance>();
  static String keyLastOpenedEmUserName = "lastOpenedEmUsername";

  late final SharedPreferences _prefs;

  Future<SharedPreferenceInstance> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }
}
