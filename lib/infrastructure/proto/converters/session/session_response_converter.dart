import 'dart:convert';

import 'package:front/contracts/proto/auth.pb.dart' as authProto;
import 'package:front/infrastructure/auth/value_objects/session_object.dart';

import 'session_object_converter.dart';

class SessionResponseConverter {
  static SessionObject fromString(String? sessionResponse) {
    if (sessionResponse == null || sessionResponse.isEmpty) {
      throw Exception('Empty session response');
    }

    final protosessionResponse = authProto.SessionResponse()
      ..mergeFromProto3Json(jsonDecode(sessionResponse as String)); // работает

    return SessionResponseConverter.fromProto(protosessionResponse);
  }

  static SessionObject fromProto(authProto.SessionResponse response) {
    if (response.hasSession()) {
      return SessionObjectConverter.fromProto(response.session);
    }

    if (response.hasError()) {
      final error = response.error;

      throw response.error;
    }

    throw Exception('Empty session response');
  }
}
