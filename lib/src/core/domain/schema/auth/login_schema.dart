import 'package:json_annotation/json_annotation.dart';
part 'login_schema.g.dart';

@JsonSerializable()
class LoginSchema {
  final String email;
  final String password;

  LoginSchema({
    required this.email,
    required this.password,
  });

  factory LoginSchema.fromJson(Map<String, dynamic> json) =>
      _$LoginSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$LoginSchemaToJson(this);
}
