class HttpException implements Exception {
  String message;

  HttpException([this.message = 'Unhandled']);

  @override
  String toString() {
    return 'HttpException{message: $message}';
  }
}
