part of 'api_service.dart';

class ApiResponse extends Equatable {
  final  body;
  final int statusCode;
  final String url;

  bool get success => (statusCode >= 200 && statusCode <= 250) && body != null;

  bool get successInBode => ((body?['data'] as Map?) ?? {})['success'] ?? false;

  const ApiResponse({
    this.body,
    required this.statusCode,
    required this.url,
  });

  bool get successInBody => body?['data']['success'] ?? false;

  factory ApiResponse.fromResponse(Response response) {
    String bodyString = jsonEncode(response.data);
    var decodedBody = jsonDecode(bodyString);
    final  body = decodedBody;
    return ApiResponse(
        statusCode: response.statusCode ?? 0,
        body: body,
        url: response.requestOptions.uri.path);
  }

  Response toResponse() {
    return Response(
      requestOptions: RequestOptions(headers: {}),
      data: body,
      statusCode: statusCode,
    );
  }

  @override
  List<Object?> get props => [body, statusCode];

  @override
  String toString() {
    return 'ApiResponse{body: $body, statusCode: $statusCode}';
  }
}
