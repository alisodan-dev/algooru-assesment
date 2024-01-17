import 'dart:io';

import 'package:assesment_app/core/exceptions/app_exceptions.dart';
import 'package:assesment_app/core/utils/constants.dart';
import 'package:assesment_app/core/utils/enums.dart';
import 'package:assesment_app/core/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
part 'api_request.dart';
part 'api_response.dart';

abstract class Api {
  Future<ApiResponse> request(ApiRequest request);
}

class ApiServices implements Api {
  ApiServices({required this.dio});
  final Dio dio;

  @override
  Future<ApiResponse> request(ApiRequest request) async {
    try {
      final Response response;
      FormData? formData;

      final options = Options(
          headers: request.headers,
          sendTimeout: AppConstants.sendTimeOut,
          receiveTimeout: AppConstants.sendTimeOut);

      Logger().i(
        {
          "url": request.url,
          "method": request.requestType,
          "headers": request.headers,
          "body": request.body,
          "params": request.params ?? {},
        },
      );
      switch (request.requestType) {
        case RequestType.get:
          response = await dio.get(
            request.url,
            data: formData,
            queryParameters: request.params,
            options: options,
          );
          break;
        case RequestType.post:
          response = await dio.post<Map<String, dynamic>>(
            request.url,
            data: formData,
            queryParameters: request.params,
            options: options,
          );
          break;
        case RequestType.put:
          response = await dio.put<Map<String, dynamic>>(
            request.url,
            data: formData,
            queryParameters: request.params,
            options: options,
          );
          break;
        case RequestType.delete:
          response = await dio.delete<Map<String, dynamic>>(
            request.url,
            data: formData,
            queryParameters: request.params,
            options: options,
          );
          break;
      }
      return ApiResponse.fromResponse(response);
    } on DioException catch (e) {
      Logger().e(
        e,
      );

      if (e.response == null) {
        throw AppException(
          Utils.mapDioExceptionToExceptionCode(e.type),
          message: e.message,
        );
      } else if ((e.response?.statusCode != 200 ||
              e.response?.statusCode != 201) &&
          e.response?.statusCode != null) {
        throw AppException(
            Utils.mapStatusCodeIntoExceptionCode(e.response!.statusCode!),
            message: e.message);
      }

      throw DioException(
          response: e.response,
          message: e.message,
          error: e.error,
          requestOptions: e.requestOptions);
    } on Exception catch (e) {
      Logger().e(
        e,
      );
      rethrow;
    }
  }
}
