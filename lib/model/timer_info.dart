class TimerInfo {
  final int number;
  final bool paused;
  final int secondsLeft;

  const TimerInfo({
    required this.number,
    required this.paused,
    required this.secondsLeft,
  });

  TimerInfo copyWith({
    int? number,
    bool? paused,
    int? secondsLeft,
  }) {
    return TimerInfo(
      number: number ?? this.number,
      paused: paused ?? this.paused,
      secondsLeft: secondsLeft ?? this.secondsLeft,
    );
  }
}
