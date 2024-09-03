import 'package:dio/dio.dart';
import 'package:mpia/src/core/data/model/auth/user_model.dart';
import 'package:mpia/src/core/domain/schema/auth/login_schema.dart';
import 'package:mpia/src/core/model/base_model.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('auth/login')
  Future<BaseModel<UserModel>> login(@Body() LoginSchema schema);

  @GET('user/profile')
  Future<BaseModel<UserModel>> getUserProfile(
      {@Query('language') String language = '1'});
}
