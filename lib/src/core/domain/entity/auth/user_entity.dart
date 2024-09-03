import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity extends Equatable {
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

  const UserEntity(
      {required this.userId,
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
      this.schoolName});

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        token,
        status,
        roleId,
        refreshToken,
        schoolId,
        cerdasTypeId,
        imageUrl,
        fullName,
        verified,
        email,
        joinClass,
        schoolName,
      ];
}
