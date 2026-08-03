import 'package:fixnum/fixnum.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';
import 'package:protobuf/well_known_types/google/protobuf/duration.pb.dart'
    as pb;

Timestamp toTimestamp(DateTime dateTime) {
  final millis = dateTime.millisecondsSinceEpoch;

  return Timestamp()
    ..seconds = Int64(millis ~/ 1000)
    ..nanos = (millis % 1000) * 1000000;
}

DateTime fromTimestamp(Timestamp timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(
    timestamp.seconds.toInt() * 1000 + timestamp.nanos ~/ 1000000,
    isUtc: true,
  ).toLocal();
}

pb.Duration toDuration(Duration duration) {
  return pb.Duration()
    ..seconds = Int64(duration.inSeconds)
    ..nanos = (duration.inMicroseconds % 1000000) * 1000;
}

Duration fromDuration(pb.Duration duration) {
  return Duration(
    seconds: duration.seconds.toInt(),
    microseconds: duration.nanos ~/ 1000,
  );
}
