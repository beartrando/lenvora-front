import 'dart:convert';

import 'package:front/contracts/proto/streaming.pb.dart' as streamingProto;

import '../../../domain/entities/battle.dart';
import '../battle_converter.dart';

class BattleResponseConverter {
  static Battle fromString(String? battleResponse) {
    if (battleResponse == null || battleResponse.isEmpty) {
      throw Exception('Empty battle response');
    }

    final protoBattleResponse = streamingProto.BattleResponse()
      ..mergeFromProto3Json(jsonDecode(battleResponse as String)); // работает

    return BattleResponseConverter.fromProto(protoBattleResponse);
  }

  static Battle fromProto(streamingProto.BattleResponse response) {
    if (response.hasBattle()) {
      return BattleConverter.fromProto(response.battle);
    }

    if (response.hasError()) {
      throw Exception(response.error.message);
    }

    throw Exception('Empty battle response');
  }
}
