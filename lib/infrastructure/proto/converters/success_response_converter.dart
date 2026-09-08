import 'dart:convert';

import 'package:front/contracts/proto/common/response.pb.dart' as responseProto;
import 'package:logger/logger.dart';

final logger = Logger();

class SuccessResponseConverter {
  static bool fromString(String? successResponse) {
    if (successResponse == null || successResponse.isEmpty) {
      throw Exception('Empty success response');
    }

    logger.i(jsonDecode(successResponse as String));
    final protoSuccessResponse = responseProto.SuccessResponse()
      ..mergeFromProto3Json(jsonDecode(successResponse as String)); // работает

    return SuccessResponseConverter.fromProto(protoSuccessResponse);
  }

  static bool fromProto(responseProto.SuccessResponse response) {
    if (response.hasSuccess()) {
      return response.success;
    }

    if (response.hasError()) {
      final error = response.error;

      throw response.error;
    }

    throw Exception('Empty success response');
  }
}
