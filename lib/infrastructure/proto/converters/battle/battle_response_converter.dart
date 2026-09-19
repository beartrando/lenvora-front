import 'dart:convert';

import 'package:front/contracts/proto/battle.pb.dart' as battle_proto;
import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/infrastructure/proto/converters/battle/battle_converter.dart';

class BattleResponseConverter {
  static Battle fromString(String? battleResponse) {
    if (battleResponse == null || battleResponse.isEmpty) {
      throw Exception('Empty battle response');
    }

    final protoBattleResponse = battle_proto.BattleResponse()
      ..mergeFromProto3Json(jsonDecode(battleResponse));

    return BattleResponseConverter.fromProto(protoBattleResponse);
  }

  static Battle fromProto(battle_proto.BattleResponse response) {
    if (response.hasBattle()) {
      return BattleConverter.fromProto(response.battle);
    }

    if (response.hasError()) {
      throw response.error;
    }

    throw Exception('Empty battle response');
  }
}
