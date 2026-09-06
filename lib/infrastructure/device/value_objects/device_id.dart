class DeviceId {
  final String value;

  const DeviceId(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DeviceId && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
