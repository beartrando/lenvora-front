import 'package:fixnum/fixnum.dart';
import 'package:protobuf/well_known_types/google/protobuf/duration.pb.dart'
    as pb;

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
