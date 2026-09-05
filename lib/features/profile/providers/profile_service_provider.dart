import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/profile/providers/profile_client_provider.dart';
import 'package:front/src/params/client_params.dart';

import '../domain/profile_domain.dart';

final profileServiceProvider = Provider.family<ProfileDomain, ClientParams>((
  ref,
  params,
) {
  final profileClient = ref.watch(profileClientProvider(params));
  return ProfileDomain(profileClient);
});
