class NotFoundException implements Exception {
  NotFoundException(this.message);
  final String message;

  @override
  String toString() {
    return 'NotFoundException: $message';
  }
}
