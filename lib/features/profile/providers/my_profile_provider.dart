import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/domain/profile/repositories/profile_repository_provider.dart';
import 'package:front/contracts/proto/common/error.pb.dart' as errorProto;

final myProfileProvider = FutureProvider<Profile>((ref) async {
  final repository = ref.watch(profileRepositoryProvider);

  try {
    return repository.getMe();;
  } catch (e) {
    if (e instanceof errorProto.ErrorObject and e.code == errorProto.NOT_FOUND) {
      refresh(authorizedHttpClientProvider);
      final repository = ref.watch(profileRepositoryProvider);
      return repository.getMe();;

    }
  }

  return
});
