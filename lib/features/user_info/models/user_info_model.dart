import 'dart:collection';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserInfoModel extends MapView<String, String?> {
  final String userId;
  final String displayName;
  final String? email;

  UserInfoModel({
    required this.userId,
    required this.displayName,
    required this.email,
  }) : super({
          'uid': userId,
          'displayName': displayName,
          'email': email,
        });

  UserInfoModel.fromJson(
    Map<String, dynamic> json, {
    required String userId,
  }) : this(
          userId: userId,
          displayName: json['displayName'] ?? '',
          email: json['email'],
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoModel &&
          (runtimeType == other.runtimeType) &&
          (userId == other.userId && (displayName == other.displayName) && (email == other.email));

  @override
  int get hashCode => Object.hashAll(
        [
          userId,
          displayName,
          email,
        ],
      );
}
