import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/domain/profile/value_objects/profile_id.dart';
import 'package:front/features/profile/providers/profile_provider.dart';
import 'package:front/features/profile/ui/profile_details_screen.dart';
import 'package:front/infrastructure/localization/generated/l10n.dart';

class PlayerName extends ConsumerWidget {
  final ProfileId profileId;

  const PlayerName({required this.profileId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider(this.profileId));

    return profileAsync.when(
      data: (profile) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileDetailScreen(profile: profile),
              ),
            );
          },
          child: Text(
            profile.nickname.value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue, // выделим кликабельность
              decoration: TextDecoration.underline,
            ),
          ),
        );
      },
      loading: () => Text(S.of(context).loading),
      error: (err, _) => Text(S.of(context).error(err)),
    );
  }
}
