class DeleteResourceException implements Exception {
  DeleteResourceException([this.message]);
  final String? message;

  @override
  String toString() {
    const out = 'DeleteResourceException';
    if (message is String) return '$out: $message';
    return out;
  }
}

class DeleteResourceGenericException extends DeleteResourceException {
  DeleteResourceGenericException()
      : super('Ha ocurrido un error al intentar eliminar el recurso.');
}
