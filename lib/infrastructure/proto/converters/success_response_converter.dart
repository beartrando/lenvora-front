import 'dart:convert';

import 'package:front/contracts/proto/common/response.pb.dart'
    as response_proto;
import 'package:logger/logger.dart';

final logger = Logger();

class SuccessResponseConverter {
  static bool fromString(String? successResponse) {
    if (successResponse == null || successResponse.isEmpty) {
      throw Exception('Empty success response');
    }

    // logger.i(jsonDecode(successResponse as String));
    final protoSuccessResponse = response_proto.SuccessResponse()
      ..mergeFromProto3Json(jsonDecode(successResponse));

    return SuccessResponseConverter.fromProto(protoSuccessResponse);
  }

  static bool fromProto(response_proto.SuccessResponse response) {
    if (response.hasSuccess()) {
      return response.success;
    }

    if (response.hasError()) {
      throw response.error;
    }

    throw Exception('Empty success response');
  }
}
