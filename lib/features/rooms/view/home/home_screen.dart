import 'package:booking/core/utils/colors.dart';
import 'package:booking/features/booking/providers/total_provider.dart';
import 'package:booking/features/booking/providers/selected_date_provider.dart';
import 'package:booking/features/booking/view/booking/booking_screen.dart';
import 'package:booking/features/rooms/providers/rooms_provider.dart';
import 'package:booking/features/rooms/view/home/widgets/booking_list.dart';
import 'package:booking/features/rooms/view/home/widgets/room_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rooms = ref.watch(roomsProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Explore Rooms'),
        actions: const [BookingListWidget()],
        backgroundColor: AppColors.kSecondaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          ref.refresh(roomsProvider);
          return Future.delayed(
            const Duration(seconds: 1),
          );
        },
        child: rooms.when(
          skipLoadingOnRefresh: false,
          data: (rooms) {
            return ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: RoomCard(
                    callback: () {
                      //clear cached providers data
                      ref.read(selectedDateProvider.notifier).clearDates();
                      ref.read(totalProvider.notifier).clearTotal();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookingScreen(
                            room: room,
                          ),
                        ),
                      );
                    },
                    roomName: room.name,
                    roomDescription: room.description,
                    price: room.price,
                  ),
                );
              },
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.kSecondaryColor),
              ),
            );
          },
          error: (error, stackTrace) {
            return const Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }
}
