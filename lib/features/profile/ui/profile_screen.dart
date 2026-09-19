import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/profile/providers/my_profile_provider.dart';
import 'package:front/infrastructure/localization/generated/l10n.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(myProfileProvider);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).profile)),
      body: profileAsync.when(
        data: (profile) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).profileId(profile.id.value),
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).profileNickname(profile.nickname.value),
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text(S.of(context).error(err))),
      ),
    );
  }
}
