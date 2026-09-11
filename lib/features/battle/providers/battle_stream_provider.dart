import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/features/battle/infrastructure/websocket/battle_channel_provider.dart';

final battleStreamProvider = StreamProvider.autoDispose<Battle>((ref) async* {
  // logger.i('battleStreamProvider');

  final battleChannel = await ref.watch(battleChannelProvider.future);
  // logger.i('battleChannel created');

  try {
    // logger.i('before battleChannel.start');

    ref.onDispose(() {
      battleChannel.close();
    });

    battleChannel.init();

    // logger.i('after watch');
  } catch (e, st) {
    logger.e('watch failed', error: e, stackTrace: st);
    rethrow;
  }

  // logger.i('Joined to stream');

  // yield* battleChannel.messages.map(BattleResponseConverter.fromProto);
  yield* battleChannel.messages;

  ref.onDispose(() {
    // logger.i('battle stream onDispose');
    battleChannel.close();
  });
});
