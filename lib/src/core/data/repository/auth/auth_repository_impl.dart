import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mpia/src/core/abstract/usecase.dart';
import 'package:mpia/src/core/data/datasource/auth/auth_service.dart';
import 'package:mpia/src/core/domain/entity/auth/user_entity.dart';
import 'package:mpia/src/core/domain/schema/auth/login_schema.dart';
import 'package:mpia/src/core/model/base_model.dart';
import 'package:mpia/src/core/services/api_exceptions.dart';
import 'package:mpia/src/core/services/local_auth_data.dart';
import 'package:mpia/src/core/utils/extensions/type_def.dart';

import '../../../domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService service;
  final Dio dio;
  final LocalAuthData localAuthData;

  AuthRepositoryImpl(
      {required this.service, required this.dio, required this.localAuthData});

  @override
  FutureEither<BaseModel<UserEntity>> login(LoginSchema schema) async {
    try {
      final result = await service.login(schema);
      print(result.data.token);
      localAuthData.setAuth(result.data);
      dio.options.headers.addAll(localAuthData.getHeader());
      return right(result);
    } on DioException catch (e) {
      return left(Failure(message: ApiException().getExceptionMessage(e)));
    }
  }

  @override
  FutureEither<BaseModel<UserEntity>> getProfile() async {
    try {
      final result = await service.getUserProfile();
      return right(result);
    } on DioException catch (e) {
      return left(Failure(message: ApiException().getExceptionMessage(e)));
    }
  }
}
