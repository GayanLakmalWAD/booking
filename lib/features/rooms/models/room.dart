import 'package:flutter/foundation.dart' show immutable;

@immutable
class Room {
  final String roomId;
  final String name;
  final String description;
  final String price;

  Room({
    required this.roomId,
    required Map<String, dynamic> json,
  })  : name = json['name'],
        description = json['description'],
        price = json['price'];

}
