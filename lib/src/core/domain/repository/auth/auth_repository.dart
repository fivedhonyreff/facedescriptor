import 'package:mpia/src/core/domain/entity/auth/user_entity.dart';
import 'package:mpia/src/core/domain/schema/auth/login_schema.dart';
import 'package:mpia/src/core/model/base_model.dart';
import 'package:mpia/src/core/utils/extensions/type_def.dart';

abstract class AuthRepository {
  FutureEither<BaseModel<UserEntity>> login(LoginSchema schema);
  FutureEither<BaseModel<UserEntity>> getProfile();
}
