class ServerErrorException implements Exception {
  ServerErrorException(this.message);
  final String message;

  @override
  String toString() {
    return 'ServerErrorException: $message';
  }
}
