import 'package:dartz/dartz.dart';
import 'package:mpia/src/core/domain/entity/auth/user_entity.dart';
import 'package:mpia/src/core/domain/repository/auth/auth_repository.dart';
import 'package:mpia/src/core/domain/schema/auth/login_schema.dart';
import 'package:mpia/src/core/model/base_model.dart';

import '../../../abstract/usecase.dart';

class LoginUsecase extends Usecase<BaseModel<UserEntity>, LoginSchema> {
  final AuthRepository _repository;

  LoginUsecase(this._repository);

  @override
  Future<Either<Failure, BaseModel<UserEntity>>> call(LoginSchema params) {
    return _repository.login(params);
  }
}
