// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['userId'] as int,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['token'] as String?,
      json['refreshToken'] as String?,
      json['status'] as bool?,
      json['roleId'] as int?,
      json['schoolId'] as int?,
      json['cerdasTypeId'] as int?,
      json['imageUrl'] as String?,
      json['fullName'] as String?,
      json['verified'] as bool?,
      json['email'] as String?,
      json['joinClass'] as String?,
      json['schoolName'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'status': instance.status,
      'roleId': instance.roleId,
      'schoolId': instance.schoolId,
      'cerdasTypeId': instance.cerdasTypeId,
      'imageUrl': instance.imageUrl,
      'fullName': instance.fullName,
      'verified': instance.verified,
      'email': instance.email,
      'joinClass': instance.joinClass,
      'schoolName': instance.schoolName,
    };
