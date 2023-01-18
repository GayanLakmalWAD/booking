import 'package:flutter_riverpod/flutter_riverpod.dart';

final totalProvider = StateNotifierProvider<TotalNotifier, String>((ref) {
  return TotalNotifier();
});


class TotalNotifier extends StateNotifier<String> {
  TotalNotifier() : super("0");

  set setTotal(String total) {
    state = total;
  }

  void clearTotal(){
    state = "0";
  }
}