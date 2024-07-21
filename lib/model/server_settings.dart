enum ServerStatus {
  ok,
  disconnected,
  credentialsError,
  requestError,
  communicationError,
  internalError,
  unhandledError,
  configurationError;
}

class ServerSettings {
  final String id;
  ServerStatus status;
  final String description;
  final DateTime createdAt;
  String? port;
  String? url;
  String? sessionId;
  String? sessionKey;
  String? username;
  String? password;

  ServerSettings(
      {required this.id,
      required this.status,
      required this.description,
      required this.createdAt});
}
