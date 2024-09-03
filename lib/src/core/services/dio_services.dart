import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mpia/src/core/constants/environment.dart';
import 'package:mpia/src/core/services/local_auth_data.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio dioServices() {
  Dio dio = Dio();
  final auth = GetIt.I<LocalAuthData>();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Device-Type': '1',
  };
  headers.addAll(auth.getHeader());
  dio.options = BaseOptions(baseUrl: Environment.baseUrl, headers: headers);

  if (!kReleaseMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }

  return dio;
}
