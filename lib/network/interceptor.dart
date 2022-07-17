import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    // logPrint('HEADERS:');
    // options.headers.forEach((key, v) => printKV(' - $key', v));
    printAll(
        'REQUEST[${options.method}] PATH[${options.baseUrl}${options.path}${options.queryParameters}] => BODY: ${options.data.toString()}');

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logPrint('*** Api Error - Start ***:');

    logPrint('URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      logPrint('STATUS CODE: ${err.response?.statusCode?.toString()}');
    }
    logPrint('$err');
    if (err.response != null) {
      printAll('BODY: ${err.response?.data}');
    }

    logPrint('*** Api Error - End ***:');
    return handler.next(err);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {

    printAll('RESPONSE[${response.statusCode}] => DATA: ${response.data.toString()}');

    return handler.next(response);
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
    debugPrint(s);
  }
}