import 'package:fixnum/fixnum.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

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
