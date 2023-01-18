import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../user_info/backend/user_info_storage.dart';
import '../backend/authenticator.dart';
import '../models/auth_result.dart';
import '../models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthSate> {
  final _authenticator = Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  AuthStateNotifier() : super(const AuthSate.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthSate(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }
    state = AuthSate(
        result: result,
        isLoading: false,
        userId: userId
    );
  }

  Future<void> saveUserInfo({required String userId}) {
    return _userInfoStorage.saveUserInfo(
      userId: userId,
      displayName: _authenticator.displayName,
      email: _authenticator.email,
    );
  }
}
