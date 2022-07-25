class ResponseEmptyException implements Exception {
  String message;

  ResponseEmptyException([this.message = '결과값이 없습니다.']);

  @override
  String toString() {
    return 'ResponseEmptyException{message: $message}';
  }
}
