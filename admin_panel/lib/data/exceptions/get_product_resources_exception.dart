abstract class GetProductResourcesException implements Exception {
  const GetProductResourcesException([this.message]);
  final String? message;

  @override
  String toString() {
    const out = 'GetProductResourcesException';
    if (message is String) return '$out: $message';
    return out;
  }
}

class ProductNotFoundException extends GetProductResourcesException {
  const ProductNotFoundException(String gtin)
      : super('No se ha encontrado el producto de GTIN = $gtin.');
}

class SomethingWentWrongException extends GetProductResourcesException {
  const SomethingWentWrongException(String gtin)
      : super('Algo ha salido mal al realizar la búsqueda '
            'del producto de GTIN = $gtin');
}
