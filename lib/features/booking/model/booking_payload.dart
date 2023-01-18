import 'dart:collection' show MapView;
import 'package:cloud_firestore/cloud_firestore.dart' show FieldValue;
import 'package:flutter/foundation.dart' show immutable;

@immutable
class BookingPayload extends MapView<String, dynamic> {
  BookingPayload({
    required String fromUserId,
    required String onRoomId,
    required String startDate,
    required String endDate,
    required String customerName,
    required String total,
    required String days,
  }) : super(
    {
      'uid': fromUserId,
      'room_id': onRoomId,
      'start_date': startDate,
      'end_date': endDate,
      'customer_name': customerName,
      'total': total,
      'days': days,
      'created_at': FieldValue.serverTimestamp(),
    },
  );
}
