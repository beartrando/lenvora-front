import 'package:front/src/contracts/proto/profile.pb.dart';
import 'package:logger/logger.dart';

import '../clients/profile_client.dart';

final logger = Logger();

class ProfileService {
  final ProfileClient profileClient;

  ProfileService(this.profileClient);

  Future<ProfileObject?> getMe() async {
    return await profileClient.getMe();
  }

  Future<ProfileObject?> get(String profileId) async {
    return await profileClient.getProfile(profileId);
  }
}
