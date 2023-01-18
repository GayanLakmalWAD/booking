import 'package:flutter/foundation.dart' show immutable;
import 'auth_result.dart';

@immutable
class AuthSate {
  final AuthResult? result;
  final bool isLoading;
  final String? userId;

  const AuthSate({
    required this.result,
    required this.isLoading,
    required this.userId,
  });

  const AuthSate.unknown()
      : result = null,
        isLoading = false,
        userId = null;

  AuthSate copiedWithIsLoading(bool isLoading){
    return AuthSate(
      result: result,
      isLoading: isLoading,
      userId: userId,
    );
  }

  @override
  bool operator == (covariant AuthSate other){
    return identical(this, other) ||
        (result == other.result &&
            isLoading == other.isLoading &&
            userId == other.userId
        );
  }

  @override
  int get hashCode => Object.hash(
    result,
    isLoading,
    userId,
  );
}