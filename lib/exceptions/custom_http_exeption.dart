class CustomHttpException implements Exception {
  CustomHttpException(this.message);
  final String message;

  @override
  String toString() {
    return 'CustomHttpException: $message';
  }
}
