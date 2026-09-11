import 'dart:async';

import 'package:front/contracts/proto/common/ping.pb.dart';
import 'package:front/contracts/proto/streaming.pb.dart' as streamingProto;
import 'package:front/contracts/proto/streaming.pb.dart';
import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/domain/battle/value_objects/battle_id.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';
import 'package:front/infrastructure/proto/converters/streaming/battle_response_converter.dart';
import 'package:front/infrastructure/proto/converters/timestamp_converter.dart';
import 'package:front/infrastructure/websocket/websocket_connection.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class BattleChannel extends WebsocketConnection<Battle> {
  late ProfileId profileId;
  final pathname = 'battle';

  messageHandler(List<int> message) {
    try {
      final battle = BattleResponseConverter.fromProto(
        streamingProto.BattleResponse.fromBuffer(message),
      );
      // logger.i('before battle added to controller');
      safeAdd(battle);
      // logger.i('battle added to controller');

      // logger.i('battle added to controller');
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
      ..battleId = battleId.value;

    final req = BattleRequest()..move = moveReq;
    // logger.d(req);
    channel.sink.add(req.writeToBuffer());
    // logger.i('Sent profile: $profileId at $cellIdx');
  }

  void leave(BattleId battleId) {
    final req = BattleRequest()
      ..leave = (BattleLeave()..battleId = battleId.value);
    // logger.d(req);
    channel.sink.add(req.writeToBuffer());
    // logger.i('Sent profile: $profileId at $cellIdx');
  }

  connectBot(BattleId battleId) {
    // logger.i('Move event');
    final connectBotRequest = streamingProto.BattleJoinBot()
      ..battleId = battleId.value;

    final req = BattleRequest()..connectBot = connectBotRequest;
    // logger.d(req);
    channel.sink.add(req.writeToBuffer());
    // logger.i('Sent profile: $profileId at $cellIdx');
  }

  create([BattleId? battleId]) {
    final request = streamingProto.BattleCreate();

    if (battleId != null) {
      request.battleId = battleId.value;
    }

    final req = BattleRequest()..create = request;

    channel.sink.add(req.writeToBuffer());

    // logger.i('Sent start battle: $battleId');
  }

  start([BattleId? battleId]) {
    final request = streamingProto.BattleStart();

    if (battleId != null) {
      request.battleId = battleId.value;
    }

    final req = BattleRequest()..start = request;
    channel.sink.add(req.writeToBuffer());

    // logger.i('Sent start battle: $battleId');
  }

  Future<void> ping() async {
    final req = BattleRequest()
      ..ping = (Ping()..timestamp = TimestampConverter().to(DateTime.now()));
    channel.sink.add(req.writeToBuffer());
  }
}
