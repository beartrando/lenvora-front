import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/profile_provider.dart';
import '../profile_details_screen.dart';

class PlayerName extends ConsumerWidget {
  final String profileId;

  const PlayerName({required this.profileId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

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
            profile.nickname,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue, // выделим кликабельность
              decoration: TextDecoration.underline,
            ),
          ),
        );
      },
      loading: () => const Text("Загрузка..."),
      error: (err, _) => Text("Ошибка: $err"),
    );
  }
}
