import 'dart:convert';

import 'package:front/contracts/proto/profile.pb.dart' as profile_proto;
import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/infrastructure/proto/converters/profile/profile_converter.dart';

class ProfileResponseConverter {
  static Profile fromString(String? profileResponse) {
    if (profileResponse == null || profileResponse.isEmpty) {
      throw Exception('Empty profile response');
    }

    final protoProfileResponse = profile_proto.ProfileResponse()
      ..mergeFromProto3Json(jsonDecode(profileResponse as String));

    return ProfileResponseConverter.fromProto(protoProfileResponse);
  }

  static Profile fromProto(profile_proto.ProfileResponse response) {
    if (response.hasProfile()) {
      return ProfileConverter.fromProto(response.profile);
    }

    if (response.hasError()) {
      final error = response.error;

      throw error;
    }

    throw Exception('Empty profile response');
  }
}
