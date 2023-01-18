import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth_state.dart';
import '../notifires/auth_state_notifire.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthSate>(
  (_) => AuthStateNotifier(),
);
