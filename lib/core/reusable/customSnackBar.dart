import 'package:booking/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

SnackBar customSnackBar(BuildContext context, String msg) => SnackBar(
  content: Text(
    msg,
    style: poppinsMedium.copyWith(
      color: AppColors.kPrimaryColor,
      fontSize: Dimensions.h3,
    ),
  ),
  backgroundColor: AppColors.kSecondaryColor,
  padding: const EdgeInsets.all(15),
);