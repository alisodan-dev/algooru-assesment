part of 'api_service.dart';

class ApiRequest extends Equatable {
  final Map<String, dynamic>? headers;
  final String url;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? params;
  
  final RequestType requestType;

  const ApiRequest({
    required this.url,
    required this.requestType,
    this.headers,
    this.body,
    this.params,
   
  });


  @override
  List<Object?> get props => [headers, url, body, params, ];
}
