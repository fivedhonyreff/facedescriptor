import 'package:dio/dio.dart';

class ApiException {
  String getExceptionMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.badResponse:
        return exception.response?.data['errorMessages'] ??
            'Bad response from API server with status code ${exception.response?.statusCode}';
      case DioExceptionType.cancel:
        return exception.response?.data['errorMessages'] ??
            'Request to API server was cancelled';
      case DioExceptionType.connectionTimeout:
        return exception.response?.data['errorMessages'] ??
            'Connection timeout with API server';
      case DioExceptionType.connectionError:
        return exception.response?.data['errorMessages'] ??
            'Connection to API server failed due to internet connection';
      case DioExceptionType.receiveTimeout:
        return exception.response?.data['errorMessages'] ??
            'Receive timeout in connection with API server';
      case DioExceptionType.sendTimeout:
        return exception.response?.data['errorMessages'] ??
            'Send timeout in connection with API server';
      default:
        return exception.response?.data['errorMessages'] ??
            'Something went wrong, ${exception.message}';
    }
  }
}
