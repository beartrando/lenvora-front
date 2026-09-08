import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/domain/profile/repositories/profile_repository_provider.dart';


final myProfileProvider = FutureProvider<Profile>((ref) async {
  final repository = ref.watch(profileRepositoryProvider);

  return repository.getMe();
});
