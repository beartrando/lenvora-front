import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/api/profile_client_provider.dart';
import 'package:front/infrastructure/http/config/http_config.dart';

import './profile_repository.dart';

final profileRepositoryProvider =
    Provider.family<ProfileRepository, HttpConfig>((ref, config) {
      final authService = ref.watch(profileClientProvider(config));
      final client = ref.watch(profileClientProvider(config));

      return ProfileRepository(client);
    });
