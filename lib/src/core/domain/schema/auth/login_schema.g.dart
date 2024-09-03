// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginSchema _$LoginSchemaFromJson(Map<String, dynamic> json) => LoginSchema(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginSchemaToJson(LoginSchema instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
