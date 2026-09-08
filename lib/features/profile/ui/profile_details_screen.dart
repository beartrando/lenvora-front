import 'package:flutter/material.dart';
import 'package:front/domain/profile/entities/profile.dart';

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
            Text("ID: ${profile.id.value}"),
            Text("Уровень: ${profile.level.value}"),
            Text("Рейтинг: ${profile.rating.value}"),
            Text("Опыт: ${profile.experience.value}"),
          ],
        ),
      ),
    );
  }
}
