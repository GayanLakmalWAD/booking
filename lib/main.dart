import 'package:booking/core/providers/is_loading_provider.dart';
import 'package:booking/core/utils/colors.dart';
import 'package:booking/features/auth/providers/is_logged_in_provider.dart';
import 'package:booking/features/auth/view/login/login_screen.dart';
import 'package:booking/features/rooms/view/home/home_screen.dart';
import 'package:booking/routes/app_routes.dart';
import 'package:booking/core/providers/shared_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Booking App',
        theme: ThemeData(
          primaryColor: AppColors.kPrimaryColor,
          scaffoldBackgroundColor: AppColors.kPrimaryColor,
          canvasColor: AppColors.kPrimaryColor,
          fontFamily: "Poppins",
        ),
        builder: EasyLoading.init(),
        routes: AppRoutes.routes,
        home: Consumer(builder: (context, ref, child) {
          // ref.
          ref.listen<bool>(
            isLoadingProvider,
                (_, isLoading) {
              if (isLoading) {
                EasyLoading.show(status: 'loading...');
              } else {
                //save uid - shared prefs
                firebaseUid(ref);
                EasyLoading.dismiss();
              }
            },
          );
          //check loggedIn
          final isLoggedIn = ref.watch(isLoggedInProvider);

          return isLoggedIn ? const HomeScreen() : const LoginScreen();
        }),
      );
    });
  }
}

void firebaseUid(WidgetRef ref){
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  if(user != null){
    final uid = user.uid;
    ref.read(sharedPrefsProvider.future).then(
            (value) => value.setString('userId', uid)
    );
  }
}