import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/battle.dart';
import '../infrastructure/battle_channel_provider.dart';
import '../infrastructure/converters/battle/battle_response_converter.dart';

final battleStreamProvider = StreamProvider.autoDispose<Battle>((ref) async* {
  // logger.i('battleStreamProvider');

  final battleChannel = await ref.watch(battleChannelProvider.future);
  // logger.i('battleChannel created');

  try {
    // logger.i('before battleChannel.start');

    ref.onDispose(() {
      battleChannel.close();
    });

    battleChannel.start();

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
