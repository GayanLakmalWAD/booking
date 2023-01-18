import 'package:flutter/material.dart';
import 'package:booking/core/utils/dimensions.dart';
import 'package:booking/core/utils/styles.dart';
import 'package:booking/features/booking/providers/selected_date_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedDateWidget extends StatelessWidget {
  const SelectedDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      if (ref.watch(selectedDateProvider)?.startDate != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Start date : ${ref.watch(selectedDateProvider)!.startDate}",
              style: poppinsMedium.copyWith(
                fontSize: Dimensions.h3,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "End date : ${ref.watch(selectedDateProvider)!.endDate}",
              style: poppinsMedium.copyWith(
                fontSize: Dimensions.h3,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
