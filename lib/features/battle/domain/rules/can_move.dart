class CanMove {
  const CanMove();

  bool calculate(Battle battle, ProfileId profileId) {
    if (battle.status.value != BattleStatusEnum.active) {
      return false;
    }

    if (battle.playerIds.value.length < 2) {
      return false;
    }

    final filledCount = battle.board.filledCount;

    final currentTurnIndex = filledCount % battle.playerIds.value.length;
    final currentPlayerId = battle.playerIds.value[currentTurnIndex];

    return currentPlayerId == profileId;
  }
}
