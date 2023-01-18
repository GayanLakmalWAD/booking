import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/room.dart';

final roomsProvider = StreamProvider<Iterable<Room>>((ref) {
  final controller = StreamController<Iterable<Room>>();

  controller.onListen = () {
    controller.sink.add([]);
  };

  final sub = FirebaseFirestore.instance.collection('rooms').snapshots().listen((snapshot) {
    final documents = snapshot.docs;
    final rooms = documents
        .where(
          (doc) => !doc.metadata.hasPendingWrites,
        )
        .map(
          (doc) => Room(
            roomId: doc.id,
            json: doc.data(),
          ),
        );
    controller.sink.add(rooms);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
