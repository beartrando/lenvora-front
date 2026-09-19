import 'dart:convert';

import 'package:front/contracts/proto/auth.pb.dart' as auth_proto;
import 'package:front/infrastructure/auth/value_objects/session_object.dart';

import 'session_object_converter.dart';

class SessionResponseConverter {
  static SessionObject fromString(String? sessionResponse) {
    if (sessionResponse == null || sessionResponse.isEmpty) {
      throw Exception('Empty session response');
    }

    final protosessionResponse = auth_proto.SessionResponse()
      ..mergeFromProto3Json(jsonDecode(sessionResponse));

    return SessionResponseConverter.fromProto(protosessionResponse);
  }

  static SessionObject fromProto(auth_proto.SessionResponse response) {
    if (response.hasSession()) {
      return SessionObjectConverter.fromProto(response.session);
    }

    if (response.hasError()) {
      throw response.error;
    }

    throw Exception('Empty session response');
  }
}
