import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/date.dart';

final selectedDateProvider = StateNotifierProvider<SelectedDateNotifier, SelectedDate?>((ref) {
  return SelectedDateNotifier();
});


class SelectedDateNotifier extends StateNotifier<SelectedDate> {
  SelectedDateNotifier() : super(const SelectedDate());

  set setSelectedDate(SelectedDate dates) {
    state = dates;
  }

  void clearDates(){
    state = const SelectedDate();
  }
}