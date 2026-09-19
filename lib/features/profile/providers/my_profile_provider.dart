import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/contracts/proto/common/error.pb.dart' as error_proto;
import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/domain/profile/repositories/profile_repository_provider.dart';
import 'package:front/infrastructure/auth/auth_service_provider.dart';

final myProfileProvider = FutureProvider<Profile>((ref) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return await repository.getMe();
  } on error_proto.ErrorObject catch (error) {
    if (error.code == error_proto.ErrorCode.NOT_FOUND) {
      final authService = ref.watch(authServiceProvider);

      await authService.getOrCreateAccessToken(true);

      return await repository.getMe();
    }

    rethrow;
  }
});
