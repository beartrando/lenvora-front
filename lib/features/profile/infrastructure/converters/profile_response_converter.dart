import 'dart:convert';

import 'package:front/contracts/proto/profile.pb.dart' as profileProto;

import '../../domain/entities/profile.dart';
import './profile_converter.dart';

class ProfileResponseConverter {
  static Profile fromString(String? profileResponse) {
    if (profileResponse == null || profileResponse.isEmpty) {
      throw Exception('Empty auth response');
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
      throw Exception(response.error.message);
    }

    throw Exception('Empty profile response');
  }
}
