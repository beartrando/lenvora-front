import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/profile.dart';
import '../domain/repositories/profile_repository_provider.dart';

final profileProvider = FutureProvider.family<Profile, ProfileId>((
  ref,
  string profileId,
) async {
  final repository = ref.watch(profileRepositoryProvider);

  return repository.get(profileId);
});
