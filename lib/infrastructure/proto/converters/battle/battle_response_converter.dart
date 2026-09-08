import 'dart:convert';

import 'package:front/contracts/proto/battle.pb.dart' as battleProto;
import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/infrastructure/proto/converters/battle/battle_converter.dart';


class BattleResponseConverter {
  static Battle fromString(String? battleResponse) {
    if (battleResponse == null || battleResponse.isEmpty) {
      throw Exception('Empty battle response');
    }

    final protoBattleResponse = battleProto.BattleResponse()
      ..mergeFromProto3Json(jsonDecode(battleResponse as String)); // работает

    return BattleResponseConverter.fromProto(protoBattleResponse);
  }

  static Battle fromProto(battleProto.BattleResponse response) {
    if (response.hasBattle()) {
      return BattleConverter.fromProto(response.battle);
    }

    if (response.hasError()) {
      final error = response.error;

      throw response.error;
    }

    throw Exception('Empty battle response');
  }
}
