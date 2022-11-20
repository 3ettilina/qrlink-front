import 'package:admin_panel/domain/models/models.dart';
import 'package:equatable/equatable.dart';

enum ProductDetailsStatus {
  initial,
  loading,
  ready,
  addingResource,
  error,
}

class ProductDetailsState extends Equatable {
  const ProductDetailsState({
    required this.status,
    this.gtin,
    this.product,
    this.newResource,
  });

  final String? gtin;
  final Product? product;
  final Resource? newResource;
  final ProductDetailsStatus status;

  ProductDetailsState copyWith({
    String? newGtin,
    Product? newProduct,
    Resource? newResourceDetails,
    ProductDetailsStatus? newStatus,
  }) {
    return ProductDetailsState(
      gtin: newGtin ?? gtin,
      status: newStatus ?? status,
      product: newProduct ?? product,
      newResource: newResourceDetails ?? newResource,
    );
  }

  @override
  List<Object?> get props => [gtin, status];
}
