// Define tus propias clases de excepciones personalizadas
class BadRequestException implements Exception {
  BadRequestException(this.message);
  final String message;

  @override
  String toString() {
    return 'BadRequestException: $message';
  }
}
