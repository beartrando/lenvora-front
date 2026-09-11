import 'dart:convert';

import 'package:front/contracts/proto/profile.pb.dart' as profileProto;
import 'package:front/domain/profile/entities/profile.dart';
import 'package:front/infrastructure/proto/converters/profile/profile_converter.dart';

class ProfileResponseConverter {
  static Profile fromString(String? profileResponse) {
    if (profileResponse == null || profileResponse.isEmpty) {
      throw Exception('Empty profile response');
    }

    final protoProfileResponse = profileProto.ProfileResponse()
      ..mergeFromProto3Json(jsonDecode(profileResponse as String)); // работает

    return ProfileResponseConverter.fromProto(protoProfileResponse);
  }

  static Profile fromProto(profileProto.ProfileResponse response) {
    if (response.hasProfile()) {
      return ProfileConverter.fromProto(response.profile);
    }

    if (response.hasError()) {
      final error = response.error;

      throw response.error;
    }

    throw Exception('Empty profile response');
  }
}
