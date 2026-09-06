import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/battle.dart';
import '../infrastructure/battle_channel_provider.dart';

final battleStreamProvider = StreamProvider.autoDispose<Battle>((ref) async* {
  // logger.i('battleStreamProvider');

  final battleChannel = await ref.watch(battleChannelProvider);
  // logger.i('battleChannel created');

  try {
    // logger.i('before battleChannel.start');

    battleChannel.start();

    // logger.i('after watch');
  } catch (e, st) {
    logger.e('watch failed', error: e, stackTrace: st);
    rethrow;
  }

  // logger.i('Joined to stream');

  yield* battleChannel.messages;

  ref.onDispose(() {
    // logger.i('battle stream onDispose');
    battleChannel.close();
  });
});
