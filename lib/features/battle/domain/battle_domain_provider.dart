import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/battle/params/battle_params.dart';
import 'package:front/features/profile/providers/profile_provider.dart';

import '../providers/battle_channel_provider.dart';
import 'battle_domain.dart';

final battleServiceProvider =
    FutureProvider.family<BattleService, BattleParams>((ref) async {
      final battleChannel = await ref.read(battleChannelProvider);
      final profile = await ref.read(profileProvider);
      return BattleService(profile.id, battleChannel);
    });
