import 'package:dio/dio.dart';

class RestServiceClient {
  static final _client = Dio();

  static Future<Response<T>> post<T>({
    required Uri uri,
    dynamic data,
    Options? options,
  }) {
    final optionsForRequest = options ??
        Options(
          validateStatus: (status) => status == 200,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );

    return _client.postUri(uri, data: data, options: optionsForRequest);
  }

  static Future<Response<T>> get<T>({
    required Uri uri,
    Options? options,
  }) {
    final optionsForRequest = options ??
        Options(
            validateStatus: (status) => status == 200,
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
            responseType: ResponseType.json);
    return _client.getUri(uri, options: optionsForRequest);
  }

  static Future<Response<T>> delete<T>({
    required Uri uri,
    dynamic data,
    Options? options,
  }) {
    final optionsForRequest = options ??
        Options(
          validateStatus: (status) => status == 200,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );

    return _client.deleteUri(uri, data: data, options: optionsForRequest);
  }

  static Future<Response<T>> patch<T>({
    required Uri uri,
    dynamic data,
    Options? options,
  }) {
    final optionsForRequest = options ??
        Options(
          validateStatus: (status) => status == 200,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );

    return _client.patchUri(uri, data: data, options: optionsForRequest);
  }
}
