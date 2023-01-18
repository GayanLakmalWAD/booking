import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/booking_payload.dart';

class SendBookingNotifier extends StateNotifier<bool> {
  SendBookingNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> sendBooking({
    required String fromUserId,
    required String onRoomId,
    required String startDate,
    required String endDate,
    required String customerName,
    required String total,
    required String days,
  }) async {
    isLoading = true;
    final payload = BookingPayload(
      fromUserId: fromUserId,
      endDate: endDate,
      customerName: customerName,
      days: days,
      onRoomId: onRoomId,
      startDate: startDate,
      total: total,
    );
    try {
      await FirebaseFirestore.instance.collection('bookings').add(payload);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
