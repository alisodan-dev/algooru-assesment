import 'package:assesment_app/core/service_locator.dart';
import 'package:assesment_app/core/utils/shared_preferences_manager.dart';
import 'package:assesment_app/pets_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  String? cachedTheme = await SharedPreferencesManager().cachedThemeRetirever();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ProviderScope(
      child: PetsMaterial(
    cachedTheme: cachedTheme,
  ),),);
}
