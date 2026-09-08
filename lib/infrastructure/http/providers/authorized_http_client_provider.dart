import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/infrastructure/auth/auth_service_provider.dart';
import 'package:front/infrastructure/http/clients/authorized_http_client.dart';
import 'package:front/infrastructure/http/providers/http_client_provider.dart';


final authorizedHttpClientProvider = Provider<AuthorizedHttpClient>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  final authService = ref.watch(authServiceProvider);
  return AuthorizedHttpClient(authService, httpClient);
});
