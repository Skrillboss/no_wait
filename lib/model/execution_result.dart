class ExecutionResult{
  final int statusCode;
  final String message;
  final dynamic data;
  final Exception? exception;
  final StackTrace? stackTrace;

  ExecutionResult({
    required this.statusCode,
    required this.message,
    this.data,
    this.exception,
    this.stackTrace
  });
}
