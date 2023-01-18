import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/booking.dart';

final bookingListProvider = StreamProvider.family<Iterable<BookingData>, String>((ref, String userId) {
  final controller = StreamController<Iterable<BookingData>>();

  controller.onListen = () {
    controller.sink.add([]);
  };

  final sub = FirebaseFirestore.instance
      .collection('bookings')
      .where(
        'uid',
        isEqualTo: userId,
      )
      .snapshots()
      .listen((snapshot) {
    final documents = snapshot.docs;
    final bookingList = documents
        .where(
          (doc) => !doc.metadata.hasPendingWrites,
        )
        .map(
          (doc) => BookingData(
            bookingId: doc.id,
            json: doc.data(),
          ),
        );
    controller.sink.add(bookingList);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
