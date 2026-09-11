import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/domain/profile/repositories/profile_repository.dart';
import 'package:front/features/profile/infrastructure/api/profile_client_provider.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final profileClient = ref.watch(profileClientProvider);

  return ProfileRepository(profileClient);
});
