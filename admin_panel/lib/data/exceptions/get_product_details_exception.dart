class GetProductDetailsException implements Exception {
  GetProductDetailsException([this.message]);
  final String? message;

  @override
  String toString() {
    const out = 'GetProductDetailsException';
    if (message is String) return '$out: $message';
    return out;
  }
}

class NotAbleToConvertToTypeException extends GetProductDetailsException {
  NotAbleToConvertToTypeException()
      : super(
            'No se ha podido mapear la respuesta con el modelo correspondiente.');
}

class GetProductDetailsGenericException extends GetProductDetailsException {
  GetProductDetailsGenericException()
      : super('Ha ocurrido un error al intentar obtener el producto.');
}
