import 'package:booking/core/utils/colors.dart';
import 'package:booking/features/booking/providers/total_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:booking/core/utils/dimensions.dart';
import 'package:booking/core/utils/styles.dart';
import 'package:booking/features/booking/providers/selected_date_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/providers/shared_provider.dart';
import '../../../../../core/reusable/customSnackBar.dart';
import '../../../../rooms/models/room.dart';
import '../../../providers/send_booking_provider.dart';

class ConfirmButton extends StatelessWidget {
  final Room room;
  final TextEditingController customerNameController;

  const ConfirmButton({
    super.key,
    required this.room,
    required this.customerNameController,
  });

  @override
  Widget build(BuildContext ctx) {
    return Consumer(builder: (context, ref, _) {
      if (ref.watch(totalProvider) != "0") {
        return InkWell(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 50,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.kGreyColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.kPrimaryColor),
            ),
            child: Center(
              child: Text(
                "Confirm",
                style: poppinsMedium.copyWith(
                  fontSize: Dimensions.h3,
                ),
              ),
            ),
          ),
          onTap: () {
            if (customerNameController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(context, "Please enter customer name"),
              );
            } else if (ref.read(selectedDateProvider)?.startDate == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(context, "Please pick a date"),
              );
            } else {
              _submitBookingDataWithController(ctx, customerNameController, ref);
            }
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Future<void> _submitBookingDataWithController(
    BuildContext context,
    TextEditingController controller,
    WidgetRef ref,
  ) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    String userId = "";
    if(user != null){
      final uid = user.uid;
     await ref.read(sharedPrefsProvider.future).then(
              (value){
                value.setString('userId', uid).toString();
                userId = value.getString('userId').toString();
              }
      );
    }

    EasyLoading.show(status: 'Loading...');
    final isSent = await ref
        .read(
          sendBookingProvider.notifier,
        )
        .sendBooking(
          fromUserId: userId,
          startDate: ref.read(selectedDateProvider)!.startDate!,
          endDate: ref.read(selectedDateProvider)!.endDate!,
          days: ref.read(selectedDateProvider)!.dateCount,
          total: ref.read(totalProvider),
          onRoomId: room.roomId,
          customerName: controller.text,
        );
    if (isSent) {
      controller.clear();
      ref.read(selectedDateProvider.notifier).clearDates();
      ref.read(totalProvider.notifier).clearTotal();
      Future.delayed(
        const Duration(microseconds: 1),
        () {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(context, "Booking has been added successfully!"),
          );
        },
      );
    } else {
      Future.delayed(
        const Duration(microseconds: 1),
        () {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(context, "Booking has been added successfully!"),
          );
        },
      );
    }
    EasyLoading.dismiss();
  }
}
