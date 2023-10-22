class TimerModel {
  final int timer;

  TimerModel({required this.timer});

  TimerModel copyWith({
    int? timer,
  }) {
    return TimerModel(
      timer: timer ?? this.timer,
    );
  }
}
