import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{
  static SharedPreferences _preferences;

  static Future<SharedPreferences> init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static String get uiTheme => _preferences.getString("uiTheme")??"light";//default value

  static String get uiLanguage => _preferences.getString("uiLanguage")??"tr";//default value

  static setUiTheme({String uiTheme}) async{
    await _preferences.setString("uiTheme", uiTheme);
  }

  static setUiLanguage({String uiLanguage}) async{
    await _preferences.setString("uiLanguage", uiLanguage);
  }
}