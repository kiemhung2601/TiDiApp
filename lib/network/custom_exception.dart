import 'package:dio/dio.dart';
import 'package:socialworkapp/untils/constant_string.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        responseError = ResponseError(
            message: "Request to API server was cancelled",
            errorCode: dioError.type.name);
        break;

      case DioErrorType.connectTimeout:
        responseError = ResponseError(
            message: "Connection timeout with API server",
            errorCode: dioError.type.name);
        break;
      case DioErrorType.receiveTimeout:
        responseError = ResponseError(
            message: "Receive timeout in connection with API server",
            errorCode: dioError.type.name);
        break;
      case DioErrorType.response:
        responseError = ResponseError(
            message: dioError.message,
            errorCode: dioError.response!.statusCode.toString());
        break;
      case DioErrorType.sendTimeout:
        responseError = ResponseError(
            message: "Send timeout in connection with API server",
            errorCode: dioError.type.name);
        break;
      default:
        responseError = ResponseError(
            message: "Something went wrong", errorCode: dioError.type.name);
        break;
    }
  }

  late ResponseError responseError;

  static String showLocalizedError(String responseError) {
    switch(responseError) {
      case "Something went wrong":
        return ConstString.somethingWrongError;
    }
    return "";
  }
}

class ResponseError {
  String message;
  String errorCode;

  ResponseError({required this.message, required this.errorCode});
}