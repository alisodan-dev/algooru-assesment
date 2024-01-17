import 'package:assesment_app/core/utils/enums.dart';
import 'package:assesment_app/core/utils/themes/app_colors.dart';
import 'package:assesment_app/core/utils/themes/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

final appThemeData = {
  ThemeType.lightTheme: AppTheme(
      isDark: false,
      accentColor: LightAppColors.kPrimaryColor,
      errorColor: LightAppColors.kErrorColor,
      primaryColor: LightAppColors.kPrimaryColor,
      secondaryColor: LightAppColors.kAccentColor,
      scaffoldBackgroundColor: LightAppColors.kScaffoldBackgroundColor),
  ThemeType.darkTheme: AppTheme(
      isDark: true,
      accentColor: DarkAppColors.kPrimaryColor,
      errorColor: DarkAppColors.kErrorColor,
      primaryColor: DarkAppColors.kPrimaryColor,
      secondaryColor: LightAppColors.kAccentColor,
      scaffoldBackgroundColor: DarkAppColors.kScaffoldBackgroundColor),
  ThemeType.systemTheme: AppTheme.brightness == Brightness.light
      ? AppTheme(
          isDark: false,
          accentColor: LightAppColors.kPrimaryColor,
          errorColor: LightAppColors.kErrorColor,
          primaryColor: LightAppColors.kPrimaryColor,
          secondaryColor: LightAppColors.kAccentColor,
          scaffoldBackgroundColor: LightAppColors.kScaffoldBackgroundColor)
      : AppTheme(
          isDark: true,
          accentColor: DarkAppColors.kPrimaryColor,
          errorColor: DarkAppColors.kErrorColor,
          primaryColor: DarkAppColors.kPrimaryColor,
          secondaryColor: DarkAppColors.kAccentColor,
          scaffoldBackgroundColor: DarkAppColors.kScaffoldBackgroundColor),
};

class AppTheme {
  static ThemeType defaultTheme = ThemeType.lightTheme;
  static Brightness brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDark;
  Color primaryColor;
  Color secondaryColor;
  Color accentColor;
  Color errorColor;
  Color scaffoldBackgroundColor;
  AppTheme({
    required this.isDark,
    required this.accentColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.errorColor,
    required this.scaffoldBackgroundColor,
  });
  ThemeData get themeData {
    var theme = ThemeData.from(
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primaryColor,
        secondary: secondaryColor,
        onPrimary: primaryColor,
        onSecondary: secondaryColor,
        error: errorColor,
        onError: errorColor,
        background: accentColor,
        onBackground: accentColor,
        surface: scaffoldBackgroundColor,
        onSurface: scaffoldBackgroundColor,
      ),
      useMaterial3: true,
    );
    return theme.copyWith(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
            color: accentColor,
            titleTextStyle: FontManagerStyle().titleTextStyle),
        switchTheme: SwitchThemeData(
            trackColor:
                MaterialStateProperty.all(Colors.white.withOpacity(.2))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(LightAppColors.kPrimaryColor),
                textStyle: MaterialStateProperty.all(
                    FontManagerStyle().buttonTextStyle))),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(.6),
        ));
  }
}
