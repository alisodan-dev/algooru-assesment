import 'package:assesment_app/core/utils/constants.dart';
import 'package:assesment_app/core/utils/enums.dart';
import 'package:assesment_app/core/utils/themes/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Utils {
  static ExceptionCode mapDioExceptionToExceptionCode(
      DioExceptionType dioException) {
    switch (dioException) {
      case DioExceptionType.badResponse:
        return ExceptionCode.badResponse;
      case DioExceptionType.unknown:
        return ExceptionCode.unKnown;

      case DioExceptionType.cancel:
        return ExceptionCode.canceled;

      case DioExceptionType.sendTimeout:
        return ExceptionCode.noInternetConnection;

      case DioExceptionType.receiveTimeout:
        return ExceptionCode.noInternetConnection;

      case DioExceptionType.connectionTimeout:
        return ExceptionCode.noInternetConnection;

      case DioExceptionType.connectionError:
        return ExceptionCode.noInternetConnection;

      case DioExceptionType.badCertificate:
        return ExceptionCode.badCertificate;

      default:
        return ExceptionCode.unKnown;
    }
  }

  static ExceptionCode mapStatusCodeIntoExceptionCode(int statusCode) {
    switch (statusCode) {
      case 403:
        return ExceptionCode.forbieden;
      case 404:
        return ExceptionCode.notFound;
      case 500:
        return ExceptionCode.serverError;
      default:
        return ExceptionCode.unKnown;
    }
  }

  static ThemeData themeType(String? cachedTheme) {
    if (cachedTheme == "Dark Theme") {
      AppConstants.isDeviceSystemThemeDark=true;
      return appThemeData[ThemeType.darkTheme]!.themeData;
    } else if (cachedTheme == "Light Theme") {
      
      AppConstants.isDeviceSystemThemeDark=false;
      return appThemeData[ThemeType.lightTheme]!.themeData;
    } else {
      return appThemeData[ThemeType.systemTheme]!.themeData;
    }
  }
}
