import 'package:booking/core/utils/dimensions.dart';
import 'package:booking/core/utils/styles.dart';
import 'package:booking/features/booking/providers/selected_date_provider.dart';
import 'package:booking/features/booking/providers/total_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      if (ref.watch(totalProvider) != "0") {
        return Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Total : ",
                style: poppinsMedium.copyWith(
                  fontSize: Dimensions.h3,
                ),
              ),
              TextSpan(
                text:
                'Rs ${ref.watch(totalProvider)}/ ${ref.watch(selectedDateProvider)?.dateCount ?? 0} days',
                style: poppinsBold.copyWith(
                  fontSize: Dimensions.h2,
                ),
              ),
            ],
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
