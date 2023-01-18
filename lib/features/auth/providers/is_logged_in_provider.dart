import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth_result.dart';
import 'auth_state_provider.dart';

final isLoggedInProvider = Provider((ref){
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});