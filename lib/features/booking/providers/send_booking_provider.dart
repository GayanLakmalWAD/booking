import 'package:booking/features/booking/notifiers/add_booking_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sendBookingProvider =
StateNotifierProvider<SendBookingNotifier, bool>(
      (ref) => SendBookingNotifier(),
);