import 'package:flutter/foundation.dart' show immutable;

@immutable
class BookingData {
  final String bookingId;
  final String roomId;
  final String userId;
  final String customerName;
  final String startDate;
  final String endDate;
  final String total;
  final String days;

  BookingData({
    required this.bookingId,
    required Map<String, dynamic> json,
  })  : userId = json['uid'],
        roomId = json['roomId'],
        customerName = json['customer_name'],
        startDate = json['start_date'],
        endDate = json['end_date'],
        days = json['days'],
        total = json['total'];

}
