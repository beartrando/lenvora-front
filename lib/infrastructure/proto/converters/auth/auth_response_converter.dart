import 'dart:convert';

import 'package:front/contracts/proto/auth.pb.dart' as authProto;
import 'package:front/infrastructure/auth/value_objects/auth_object.dart';

import 'auth_object_converter.dart';

class AuthResponseConverter {
  static AuthObject fromString(String? authResponse) {
    if (authResponse == null || authResponse.isEmpty) {
      throw Exception('Empty auth response');
    }

    final protoAuthResponse = authProto.AuthResponse()
      ..mergeFromProto3Json(jsonDecode(authResponse as String)); // работает

    return AuthResponseConverter.fromProto(protoAuthResponse);
  }

  static AuthObject fromProto(authProto.AuthResponse response) {
    if (response.hasAuth()) {
      return AuthObjectConverter.fromProto(response.auth);
    }

    if (response.hasError()) {
      final error = response.error;

      throw response.error;
    }

    throw Exception('Empty auth response');
  }
}
