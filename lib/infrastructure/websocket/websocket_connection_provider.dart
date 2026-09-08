// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:front/src/locale/token_storage_provider.dart';
// import 'package:logger/logger.dart';
//
//
// final authServiceProvider = FutureProvider<AuthService>((ref) async {
//   final authClient = ref.watch(authClientProvider);
//   final tokenStorage = ref.watch(tokenStorageProvider);
//   var logger = Logger();
//
//   // logger.d("Debug message");
//   final authService = AuthService(authClient, tokenStorage);
//
//   return authService;
// });
