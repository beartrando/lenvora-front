abstract interface class ErrorReporter {
  void fatal(Object error, StackTrace stack);

  void report(Object error, StackTrace stack);
}
