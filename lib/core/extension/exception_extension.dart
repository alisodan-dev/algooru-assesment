import 'package:assesment_app/core/exceptions/app_exceptions.dart';
import 'package:assesment_app/core/failure/failure.dart';
import 'package:assesment_app/core/utils/assets_manager.dart';
import 'package:assesment_app/core/utils/constants.dart';
import 'package:assesment_app/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

/// an extension method used to convert the app exception class to failure
/// and pass the appropriate title, error message, and the appropriate error image
extension ExceptionExtension on Exception {
  Failure get toFailure {
    if (this is AppException) {
      Logger().e({
        "message": (this as AppException).code.message,
        "title": (this as AppException).code.title,
      });
      return Failure(
        message: (this as AppException).code.message,
        title: (this as AppException).code.title,
        errorWidget: (this as AppException).code.errorWidget,
      );
    } else {
      Logger().e(this);
      return Failure(
        message: toString().replaceFirst("Exception: ", ""),
        title: ErrorTitlesMessages.error,
        errorWidget: Lottie.asset(
          AssetsManager.error,
        ),
      );
    }
  }
}

extension ExceptionCodeExtension on ExceptionCode {
  String get message {
    switch (this) {
      case ExceptionCode.unKnown:
        return ErrorTitlesMessages.unkownErrorMessage;
      case ExceptionCode.forbieden:
        return ErrorTitlesMessages.forbiedenErrorMessage;
      case ExceptionCode.noInternetConnection:
        return ErrorTitlesMessages.noInternetErrorMessage;
      case ExceptionCode.mappingToModelException:
        return ErrorTitlesMessages.errorMappingSomeData;
      case ExceptionCode.canceled:
        return ErrorTitlesMessages.requestCanceldMessag;
      case ExceptionCode.badCertificate:
        return ErrorTitlesMessages.certificateIncorrectMessag;
      case ExceptionCode.badResponse:
        return ErrorTitlesMessages.badRequestMessage;
      case ExceptionCode.notFound:
        return ErrorTitlesMessages.notFoundErrorMessage;
      case ExceptionCode.serverError:
        return ErrorTitlesMessages.serverErrorMessage;
    }
  }

  String get title {
    switch (this) {
      case ExceptionCode.unKnown:
        return ErrorTitlesMessages.error;
      case ExceptionCode.noInternetConnection:
        return ErrorTitlesMessages.noInternet;
      case ExceptionCode.mappingToModelException:
        return ErrorTitlesMessages.error;
      case ExceptionCode.canceled:
        return ErrorTitlesMessages.error;
      case ExceptionCode.badCertificate:
        return ErrorTitlesMessages.error;
      case ExceptionCode.badResponse:
        return ErrorTitlesMessages.error;
      case ExceptionCode.forbieden:
        return ErrorTitlesMessages.forbeidenTitle;
      case ExceptionCode.notFound:
        return ErrorTitlesMessages.notFoundErrorTilte;
      case ExceptionCode.serverError:
        return ErrorTitlesMessages.error;
    }
  }

  Widget get errorWidget {
    switch (this) {
      case ExceptionCode.unKnown:
      case ExceptionCode.mappingToModelException:
        return Lottie.asset(AssetsManager.error, fit: BoxFit.fill);
      case ExceptionCode.noInternetConnection:
        return Lottie.asset(AssetsManager.noInternet, fit: BoxFit.fill);
      case ExceptionCode.badResponse:
        return Lottie.asset(AssetsManager.error, fit: BoxFit.fill);
      case ExceptionCode.canceled:
        return Lottie.asset(AssetsManager.error, fit: BoxFit.fill);
      case ExceptionCode.badCertificate:
        return Lottie.asset(AssetsManager.error, fit: BoxFit.fill);
      case ExceptionCode.forbieden:
        return Lottie.asset(AssetsManager.error, fit: BoxFit.fill);
      case ExceptionCode.notFound:
        return Lottie.asset(AssetsManager.noDataAnimation, fit: BoxFit.fill);
      case ExceptionCode.serverError:
        return Lottie.asset(AssetsManager.error, fit: BoxFit.fill);
    }
  }
}
