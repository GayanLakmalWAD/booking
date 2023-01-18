import 'package:booking/core/utils/colors.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.g_mobiledata_outlined,
            color: AppColors.googleColor,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text('Google')
        ],
      ),
    );
  }
}
