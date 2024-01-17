import 'package:assesment_app/core/service_locator.dart';
import 'package:assesment_app/core/utils/constants.dart';
import 'package:assesment_app/feature/pets_main_view/domain/use_cases/get_pets_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDogsProvider = FutureProvider((ref) async {
  return getIt<GetPetsUseCases>().getDogs(limit: 10, hasBreed: true, page: 0);
});

final getCatsProvider = FutureProvider((ref) async {
  return getIt<GetPetsUseCases>().getCats(limit: 10, hasBreed: true, page: 0);
});

final themeProvider = StateProvider<ThemeData?>((ref) => null);

final switchThemeWidgetValue = StateProvider<bool>((ref) {
  if (AppConstants.isDeviceSystemThemeDark) {
    return true;
  } else {
    return false;
  }
});
