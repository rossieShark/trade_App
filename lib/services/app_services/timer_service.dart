import 'dart:math';
import 'package:trade/models/models_index.dart';

class TimerService {
  var _timer = TimerModel(timer: 1);
  TimerModel get timer => _timer;

  void incrementValue() {
    _timer = timer.copyWith(timer: timer.timer + 1);
  }

  void decrementValue() {
    _timer = timer.copyWith(timer: max(timer.timer - 1, 0));
  }

  void onValueChanged(String value) {
    _timer = timer.copyWith(timer: int.parse(value));
  }

  String get formattedTime {
    final minutes = timer.timer ~/ 60;
    final seconds = timer.timer % 60;
    final formattedMinutes = minutes.toString().padLeft(2, '0');
    final formattedSeconds = seconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }
}
