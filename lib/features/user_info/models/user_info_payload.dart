import 'dart:collection';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required String userId,
    required String? displayName,
    required String? email,
  }) : super(
          {
            'uid': userId,
            'displayName': displayName ?? '',
            'email': email ?? ''
          },
        );
}
