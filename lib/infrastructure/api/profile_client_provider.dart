import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/api/profile_client.dart';
import 'package:front/infrastructure/http/http_client_provider.dart';

final profileClientProvider = Provider<ProfileClient>((ref) {
  return ProfileClient(ref.watch(httpClientProvider));
});
