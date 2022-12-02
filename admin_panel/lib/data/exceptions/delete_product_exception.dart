class DeleteProductException implements Exception {
  DeleteProductException([this.message]);
  final String? message;

  @override
  String toString() {
    const out = 'DeleteProductException';
    if (message is String) return '$out: $message';
    return out;
  }
}

class DeleteProductGenericException extends DeleteProductException {
  DeleteProductGenericException()
      : super('Ha ocurrido un error al intentar eliminar el producto.');
}
