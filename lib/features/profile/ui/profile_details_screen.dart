import 'package:flutter/material.dart';
import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/infrastructure/localization/generated/l10n.dart';

class ProfileDetailScreen extends StatelessWidget {
  final Profile profile;

  const ProfileDetailScreen({required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(profile.nickname.value)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).profileId(profile.id.value)),
            Text(S.of(context).profileLevel(profile.level.value)),
            Text(S.of(context).profileRating(profile.rating.value)),
            Text(S.of(context).profileExperience(profile.experience.value)),
          ],
        ),
      ),
    );
  }
}
