import 'package:flutter/foundation.dart' show immutable;

@immutable
class SelectedDate {
  final String? startDate;
  final String? endDate;
  final String dateCount;

  const SelectedDate({
    this.startDate,
    this.endDate,
    this.dateCount = "0",
  }) ;
}
