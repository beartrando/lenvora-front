import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/profile/infrastructure/api/profile_client_provider.dart';
import 'package:front/infrastructure/http/providers/authorized_http_client_provider.dart';

import './profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final profileClient = ref.watch(profileClientProvider);

  return ProfileRepository(profileClient);
});
