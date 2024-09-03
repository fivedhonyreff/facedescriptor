import 'package:json_annotation/json_annotation.dart';
import 'package:mpia/src/core/domain/entity/auth/user_entity.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  final int userId;
  final String? firstName;
  final String? lastName;
  final String? token;
  final String? refreshToken;
  final bool? status;
  final int? roleId;
  final int? schoolId;
  final int? cerdasTypeId;
  final String? imageUrl;
  final String? fullName;
  final bool? verified;
  final String? email;
  final String? joinClass;
  final String? schoolName;

  const UserModel(
      this.userId,
      this.firstName,
      this.lastName,
      this.token,
      this.refreshToken,
      this.status,
      this.roleId,
      this.schoolId,
      this.cerdasTypeId,
      this.imageUrl,
      this.fullName,
      this.verified,
      this.email,
      this.joinClass,
      this.schoolName)
      : super(
            userId: userId,
            firstName: firstName,
            lastName: lastName,
            token: token,
            refreshToken: refreshToken,
            status: status,
            roleId: roleId,
            schoolId: schoolId,
            cerdasTypeId: cerdasTypeId,
            imageUrl: imageUrl,
            fullName: fullName,
            verified: verified,
            email: email,
            joinClass: joinClass,
            schoolName: schoolName);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
