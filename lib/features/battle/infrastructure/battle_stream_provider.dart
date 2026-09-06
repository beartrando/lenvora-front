import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/battle/infrastructure/battle_service.dart';
import 'package:front/features/profile/providers/my_profile_provider.dart';
import 'package:logger/logger.dart';

import './battle_channel_provider.dart';

final logger = Logger();

final battleServiceProvider = FutureProvider<BattleService>((ref) async {
  final profile = ref.watch(myProfileProvider).requireValue;
  final channel = await ref.watch(battleChannelProvider.future);

  return BattleService(profile.id, channel);
});
