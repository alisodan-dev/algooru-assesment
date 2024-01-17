
import 'package:assesment_app/core/networking/api_service.dart';
import 'package:assesment_app/core/networking/network_configurations.dart';
import 'package:assesment_app/core/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  late ApiServices apiServices;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiServices = ApiServices(dio: mockDio);
  });

  group('request', () {
    final url = NetworkConfigurations.instance.kDogsBaseUrl;
    const requestType = RequestType.get;
    final headers = {'Content-Type': 'application/json',"x-api-key":NetworkConfigurations.instance.kDogsBaseHeaders};

    const params = {
      'page': "0",
       "limit":"10",
       "hasBreed":"true"
    };

    test('returns ApiResponse with successful response', () async {
      // Arrange
      final response = MockResponse();
      when(() => response.statusCode).thenReturn(200);
      when(() => response.requestOptions).thenReturn(RequestOptions(path: url));
      when(() => response.data).thenReturn(null);

      switch (requestType) {
        case RequestType.get:
          when(() => mockDio.get(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters'), options: any(named: 'options'))).thenAnswer((_) async => response);
          break;
        case RequestType.post:
          when(() => mockDio.post<Map<String, dynamic>>(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters'), options: any(named: 'options'))).thenAnswer((_) async => response.data);
          break;
        case RequestType.put:
          when(() => mockDio.put<Map<String, dynamic>>(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters'), options: any(named: 'options'))).thenAnswer((_) async => response.data);
          break;
        case RequestType.delete:
          when(() => mockDio.delete<Map<String, dynamic>>(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters'), options: any(named: 'options'))).thenAnswer((_) async => response.data);
          break;
      }

      final apiRequest = ApiRequest(url: url, requestType: requestType, headers: headers, body: null, params: params);

      // Act
      final apiResponse = await apiServices.request(apiRequest);

      // Assert
      expect(apiResponse.statusCode, equals(200));
      expect(apiResponse.body, equals(null));
   //   expect(apiResponse.url, equals(url));
    });

  /*    test('throws DioError when Dio throws an exception', () async {
      // Arrange
      const errorMessage = 'Request failed';
      final requestOptions = RequestOptions(path: url);
      final dioError = DioError(requestOptions: requestOptions, error: errorMessage);

      switch (requestType) {
        case RequestType.get:
          when(() => mockDio.get(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters'), options: any(named: 'options'))).thenThrow(dioError);
          break;
        case RequestType.post:
          when(() => mockDio.post<Map<String, dynamic>>(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters'), options: any(named: 'options'))).thenThrow(dioError);
          break;
        case RequestType.put:
          when(() => mockDio.put<Map<String, dynamic>>(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters'), options: any(named: 'options'))).thenThrow(dioError);
          break;
        case RequestType.delete:
          when(() => mockDio.delete<Map<String, dynamic>>(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters'), options: any(named: 'options'))).thenThrow(dioError);
          break;
      }

      final apiRequest = ApiRequest(url: url, requestType: requestType, headers: headers, body: null, params: params);

      // Act
      final call = apiServices.request(apiRequest);

      // Assert
      await expectLater(call, throwsA(predicate((e) => e is DioError && e.message == errorMessage && e.requestOptions == requestOptions && e.response == null)));
    }); */

  });
}