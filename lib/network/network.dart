import 'package:dio/dio.dart';
import 'package:socialworkapp/network/interceptor.dart';
import 'api_services.dart';

Future post(String path, {Map<String, String>? body}) async {
  Options options = Options(headers: {ApiServices.fieldKey: ApiServices.keyHeaders},);
  final dio = Dio();
  dio.interceptors.add(
    LoggingInterceptor()
  );
  final response = await dio.post(path, data: body, options: options);

  return response;
}

Future get(String path, {Map<String, String>? map}) async {
  Options options = Options(headers: {ApiServices.fieldKey: ApiServices.keyHeaders},);
  final dio = Dio();
  dio.interceptors.add(
      LoggingInterceptor()
  );
  final response = await dio.get(path, queryParameters: map, options: options);

  return response;
}