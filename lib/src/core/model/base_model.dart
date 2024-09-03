import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> {
  final int? statusCode;
  final String? message;
  final String? errorMessages;
  final T data;

  BaseModel({
    this.statusCode,
    this.errorMessages,
    this.message,
    required this.data,
  });

  factory BaseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseModelFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$BaseModelToJson<T>(this, toJsonT);
}
