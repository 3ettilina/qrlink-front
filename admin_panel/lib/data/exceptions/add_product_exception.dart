class AddProductException implements Exception {
  AddProductException([this.message]);
  final String? message;

  @override
  String toString() {
    const out = 'GetProductResourcesException';
    if (message is String) return '$out: $message';
    return out;
  }
}

class GtinAlreadyExistsException extends AddProductException {
  GtinAlreadyExistsException(String gtin)
      : super('El GTIN ($gtin) ya existe en el sistema');
}

class SomethingWentWrongException extends AddProductException {
  SomethingWentWrongException(String gtin)
      : super('Algo ha salido mal al agregar el producto de GTIN: $gtin');
}
