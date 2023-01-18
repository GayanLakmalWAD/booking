import 'package:booking/core/utils/colors.dart';
import 'package:booking/features/booking/providers/booking_list_provider.dart';
import 'package:booking/core/providers/shared_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingListWidget extends ConsumerWidget {
  const BookingListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shared = ref.watch(sharedPrefsProvider);
    return Row(
      children: [
        //watch shared and when complete bind the booking list count
        shared.when(
          data: (share) {
            return Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: ref
                  .watch(
                    bookingListProvider(
                      share.get('userId').toString(),
                    ),
                  )
                  .when(
                    data: (data) {
                      if (data.isNotEmpty) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Text(data.length.toString()),
                            ),
                            const Icon(
                              Icons.access_time_sharp,
                              color: AppColors.kPrimaryColor,
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                    error: (error, stackTrace) {},
                    loading: () {
                      return const Text('Loading...');
                    },
                  ),
            );
          },
          error: (error, stackTrace) {
            return const SizedBox.shrink();
          },
          loading: () {
            return const Text('Loading...');
          },
        ),
      ],
    );
  }
}
