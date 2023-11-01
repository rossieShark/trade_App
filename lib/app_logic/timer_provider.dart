// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:trade/services/services_index.dart';

class _TimerProviderState {
  int timer;
  _TimerProviderState({required this.timer});
}

class TimerProvider extends ChangeNotifier {
  final _timerService = TimerService();
  // ignore: prefer_final_fields
  var _state = _TimerProviderState(timer: 0);
  _TimerProviderState get state => _state;

  Future<void> onIncrementButtonPressed() async {
    _timerService.incrementValue();
    _updateState();
  }

  Future<void> onDecrementButtonPressed() async {
    _timerService.decrementValue();
    _updateState();
  }

  Future<void> onValueChanged(String value) async {
    _timerService.onValueChanged(value);
    _updateState();
  }

  String get formattedTime {
    return _timerService.formattedTime;
  }

  Future<void> onSellButtonTapped(void Function() alert) async {
    if (_state.timer > 0) {
      const oneSecond = Duration(seconds: 1);
      // ignore: unused_local_variable
      Timer timer = Timer.periodic(oneSecond, (timer) {
        if (_state.timer > 0) {
          _timerService.decrementValue();
          _updateState();
        } else {
          timer.cancel();
          alert();
          notifyListeners();
        }
      });
    }
  }

  void _updateState() {
    final timer = _timerService.timer;
    _state = _TimerProviderState(
      timer: timer.timer,
    );
    notifyListeners();
  }
}
