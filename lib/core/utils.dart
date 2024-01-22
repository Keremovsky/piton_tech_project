import 'dart:math';

String formatMusicDuration(Duration? duration) {
  if (duration == null) return "00:00";
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());

  String hour = twoDigits(duration.inHours);
  if (hour == "00") {
    return "$twoDigitMinutes:$twoDigitSeconds";
  } else {
    return "$hour:$twoDigitMinutes:$twoDigitSeconds";
  }
}

List<double> getRandomDoubles(int count) {
  final random = Random();

  List<double> randomDoubles = [];
  for (var i = 0; i < count; i++) {
    randomDoubles.add(random.nextDouble() * 30);
  }

  return randomDoubles;
}
