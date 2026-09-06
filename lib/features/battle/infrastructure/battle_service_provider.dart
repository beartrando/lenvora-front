import 'package:front/features/profile/providers/my_profile_provider.dart';

import './battle_channel_provider.dart';
import './battle_service.dart';

final battleServiceProvider = FutureProvider<BattleService>((ref) async {
  final profile = ref.watch(myProfileProvider).requireValue;
  final channel = await ref.watch(battleChannelProvider.future);

  return BattleService(profile.id, channel);
});
