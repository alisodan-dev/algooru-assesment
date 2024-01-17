import 'package:assesment_app/core/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  final String cachedThemeKey = 'cachedThemeKey';

  Future<void> themeCacher({required ThemeType themeType}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(cachedThemeKey, themeType.name);
  }

     Future<String?> cachedThemeRetirever() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final result =preferences.getString(cachedThemeKey);
    return result;
  }
}
