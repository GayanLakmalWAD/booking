import 'package:booking/features/auth/view/login/login_screen.dart';
import 'package:booking/features/rooms/view/home/home_screen.dart';
import 'package:booking/routes/routes.dart';

class AppRoutes {
  static final routes = {
    Routes.login: (context) => const LoginScreen(),
    Routes.home: (context) => const HomeScreen(),
  };
}
