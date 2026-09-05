import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/http/providers/http_client_provider.dart';
import './profile_client.dart';

final profileClientProvider = Provider<ProfileClient>((ref) {
  return ProfileClient(ref.watch(httpClientProvider));
});
