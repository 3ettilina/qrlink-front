class GetProductsException implements Exception {
  GetProductsException([this.message]);
  final String? message;

  @override
  String toString() {
    const out = 'GetProductsException';
    if (message is String) return '$out: $message';
    return out;
  }
}

class NotAbleToConvertToTypeException extends GetProductsException {
  NotAbleToConvertToTypeException()
      : super(
            'No se ha podido mapear la respuesta con el modelo correspondiente.');
}

class GetProductsGenericException extends GetProductsException {
  GetProductsGenericException()
      : super(
            'Ha ocurrido un error al intentar obtener los productos existentes.');
}
