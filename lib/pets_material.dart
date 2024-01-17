import 'package:assesment_app/core/router/route_paths.dart';
import 'package:assesment_app/core/router/router_generator.dart';
import 'package:assesment_app/core/utils/constants.dart';
import 'package:assesment_app/core/utils/utils.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/manager/pets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetsMaterial extends ConsumerWidget {
  const PetsMaterial({
    super.key,
    required this.cachedTheme,
  });
  final String? cachedTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppConstants.isDeviceSystemThemeDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: AppConstants.kAppName,
            debugShowCheckedModeBanner: false,
            theme: ref.watch(themeProvider) ?? Utils.themeType(cachedTheme),
            initialRoute: RoutePaths.homeScreen,
            onGenerateRoute: AppRouter.generateRoute,
          );
        });
  }
}
