import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier(): super(0);

  void increment() {
    state = state + 10;
    if (state > 250) {
      state = 0;
    }
  }
}

final blueCounterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

final greenCounterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

final redCounterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});