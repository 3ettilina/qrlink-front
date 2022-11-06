import 'package:qrlink/domain/models/models.dart';

class ProductResult {
  ProductResult({this.product, required this.type});
  final Product? product;
  final ProductResultType type;
}

enum ProductResultType {
  straightRedirect(),
  hasResources(),
  notFound(message: 'No se encontró el producto'),
  error(message: 'Ha ocurrido un error');

  const ProductResultType({this.message});

  final String? message;
}
