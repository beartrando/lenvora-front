import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/profile/providers/my_profile_provider.dart';
import 'package:front/infrastructure/auth/auth_service_provider.dart';
import 'package:front/infrastructure/websocket/config/streaming_config.dart';
import 'package:logger/logger.dart';

import 'battle_channel.dart';

final logger = Logger();

final battleChannelProvider = FutureProvider.autoDispose<BattleChannel>((
  ref,
) async {
  // logger.i('battleChannelProvider');

  // final existing = ref.state as BattleChannel?;
  // if (existing != null) return existing;
  final config = StreamingConfig.fromEnv();
  final profile = ref.watch(myProfileProvider).requireValue;
  final authService = ref.watch(authServiceProvider);

  final jwt = await authService.ensureAccessToken();

  return BattleChannel(config, profile.id, jwt);
});
