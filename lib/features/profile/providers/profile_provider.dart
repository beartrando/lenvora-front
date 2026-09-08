import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/domain/profile/repositories/profile_repository_provider.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';

final profileProvider = FutureProvider.family<Profile, ProfileId>((
  ref,
  ProfileId profileId,
) async {
  final repository = ref.watch(profileRepositoryProvider);

  return repository.get(profileId);
});
