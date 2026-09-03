final httpClientProvider = Provider<HttpClient>((ref) {
  return HttpClient(baseUrl: ref.watch(apiConfigProvider).baseUrl);
});
