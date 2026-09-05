import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/profile.dart';
import '../domain/repositories/profile_repository_provider.dart';
import '../domain/value_objects/profile_id.dart';

final profileProvider = FutureProvider.family<Profile, ProfileId>((
  ref,
  ProfileId profileId,
) async {
  final repository = ref.watch(profileRepositoryProvider);

  return repository.get(profileId);
});
