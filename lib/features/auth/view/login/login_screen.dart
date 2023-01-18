import 'package:booking/core/utils/app_constants.dart';
import 'package:booking/core/utils/colors.dart';
import 'package:booking/features/auth/providers/auth_state_provider.dart';
import 'package:booking/features/auth/view/login/widgets/divider_with_margins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/google_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  AppConstants.welcomeToAppName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const DividerWithMargins(),
                Text(
                  AppConstants.logIntoYourAccount,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(height: 1.5),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.kGreyColor.withOpacity(0.5),
                    foregroundColor: AppColors.kSecondaryColor,
                  ),
                  onPressed: () {
                    ref.read(authStateProvider.notifier).loginWithGoogle();
                  },
                  child: const GoogleButton(),
                ),
                const DividerWithMargins(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
