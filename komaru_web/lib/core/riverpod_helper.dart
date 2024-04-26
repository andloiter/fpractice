import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodHelper<T> {
  RiverpodHelper({required this.initValue}) {
    _providerValue = StateProvider((ref) => initValue);
    _watchValue = null;
    _readValue = null;
  }

  late T initValue;

  late StateProvider<T> _providerValue;
  late T? _watchValue;
  late StateController<T>? _readValue;

  // buildで行ってください
  void createRiverpod(WidgetRef ref) {
    _watchValue = ref.watch(_providerValue);
    _readValue = ref.read(_providerValue.notifier);
  }

  T getValue() {
    if (_watchValue == null) {
      return initValue;
    } else {
      return _watchValue!;
    }
  }

  void updateValue(T value) {
    if (_readValue == null) {
      initValue = value;
      _providerValue = StateProvider((ref) => value);
    } else {
      _readValue!.update((state) => value);
    }
  }
}
