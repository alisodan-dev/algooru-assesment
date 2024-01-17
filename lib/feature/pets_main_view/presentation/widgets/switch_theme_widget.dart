import 'package:assesment_app/core/utils/enums.dart';
import 'package:assesment_app/core/utils/shared_preferences_manager.dart';
import 'package:assesment_app/core/utils/themes/app_theme.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/manager/pets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
    
      return Switch(
          value: ref.watch(switchThemeWidgetValue),
          onChanged: (value) {
            ref.watch(switchThemeWidgetValue.notifier).state = value;
            if (value) {
              SharedPreferencesManager()
                  .themeCacher(themeType: ThemeType.darkTheme);
              ref.watch(themeProvider.notifier).state =
                  appThemeData[ThemeType.darkTheme]!.themeData;
            } else {
              SharedPreferencesManager()
                  .themeCacher(themeType: ThemeType.lightTheme);

              ref.watch(themeProvider.notifier).state =
                  appThemeData[ThemeType.lightTheme]!.themeData;
            }
          });
    });
  }
}
