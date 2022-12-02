class GenericException implements Exception {
  GenericException([this.message]);
  final String? message;

  @override
  String toString() {
    const out = 'GenericException';
    if (message is String) return '$out: $message';
    return out;
  }
}
