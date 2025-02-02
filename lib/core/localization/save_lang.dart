import 'package:shared_preferences/shared_preferences.dart';

class LanguageGetHelper {
  Future<void> cacheLanguageCode(String code) async {
    final sharedPrefernce = await SharedPreferences.getInstance();
    sharedPrefernce.setString('LOCALE', code);
  }

  Future<String> getCacheLanguageCode() async {
    final sharedPrefernce = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPrefernce.getString('LOCALE');
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return 'en';
    }
  }
}
