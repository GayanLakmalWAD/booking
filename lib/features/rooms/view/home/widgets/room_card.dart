import 'package:booking/core/utils/colors.dart';
import 'package:booking/core/utils/dimensions.dart';
import 'package:booking/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class RoomCard extends StatelessWidget {
  final VoidCallback callback;
  final String roomName;
  final String roomDescription;
  final String price;

  const RoomCard({
    super.key,
    required this.callback,
    required this.roomName,
    required this.roomDescription,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 110),
      onPressed: callback,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: AppColors.kGreyColor.withOpacity(0.3),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomName,
                    style: poppinsMedium.copyWith(
                      fontSize: Dimensions.h3,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    roomDescription,
                    style: poppinsLight.copyWith(
                      color: AppColors.kGreyColor,
                      fontSize: Dimensions.h3,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rs $price/ day',
                    style: poppinsBold.copyWith(
                      fontSize: Dimensions.h4,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
