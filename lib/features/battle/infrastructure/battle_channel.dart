import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:front/contracts/proto/battle.pb.dart' as battleProto;
import 'package:front/contracts/proto/common/ping.pb.dart';
import 'package:front/contracts/proto/streaming.pb.dart' as streamingProto;
import 'package:front/contracts/proto/streaming.pb.dart';
import 'package:front/features/profile/domain/value_objects/profile_id.dart';
import 'package:front/infrastructure/websocket/websocket_connection.dart';
import 'package:logger/logger.dart';

import '../domain/value_objects/battle_id.dart';

final logger = Logger();

class BattleChannel extends WebsocketConnection<battleProto.BattleResponse> {
  late ProfileId profileId;
  final pathname = 'battle';

  messageHandler(List<int> message) {
    try {
      final resp = BattleResponse.fromBuffer(message);
      // logger.i(resp);
      if (resp.hasBattle()) {
        final battle = resp.battle;
        // logger.i('before battle added to controller');
        safeAdd(battle);
        // logger.i('battle added to controller');

        // logger.i('battle added to controller');
      } else {
        logger.e(resp);
        logger.e('Battle handling went wrong: $resp');
      }
    } catch (e) {
      logger.e('Failed to parse: $e');
    }
  }

  getWsUri() {
    return Uri.parse(
      'ws://${config.host}:${config.port}/$pathname?token=${accessToken.value}&profileId=${this.profileId.value}',
    );
  }

  BattleChannel(super.config, this.profileId, super.accessToken);

  void move(BattleId battleId, int cellIdx) {
    // logger.i('Move event');
    final moveReq = BattleMove()
      ..cellIdx = cellIdx
      ..battleId = battleId;

    final req = BattleRequest()..move = moveReq;
    // logger.d(req);
    channel.sink.add(req.writeToBuffer());
    // logger.i('Sent profile: $profileId at $cellIdx');
  }

  void leave(BattleId battleId) {
    final req = BattleRequest()..leave = (BattleLeave()..battleId = battleId);
    // logger.d(req);
    channel.sink.add(req.writeToBuffer());
    // logger.i('Sent profile: $profileId at $cellIdx');
  }

  connectBot(BattleId battleId) {
    // logger.i('Move event');
    final connectBotRequest = streamingProto.BattleJoinBot()
      ..battleId = battleId;

    final req = BattleRequest()..connectBot = connectBotRequest;
    // logger.d(req);
    channel.sink.add(req.writeToBuffer());
    // logger.i('Sent profile: $profileId at $cellIdx');
  }

  start([BattleId? battleId]) {
    final request = streamingProto.BattleStart();

    if (battleId != null) {
      request.battleId = battleId;
    }

    final req = BattleRequest()..start = request;
    channel.sink.add(req.writeToBuffer());

    // logger.i('Sent start battle: $battleId');
  }

  Future<void> ping() async {
    final req = BattleRequest()
      ..ping = (Ping()..timestamp = toTimestamp(DateTime.now()));
    channel.sink.add(req.writeToBuffer());
  }
}
