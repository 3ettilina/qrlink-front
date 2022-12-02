import 'package:admin_panel/domain/models/models.dart';
import 'package:equatable/equatable.dart';

enum EditProductStatus { initial, editing, success, error }

class EditProductState extends Equatable {
  const EditProductState({
    required this.product,
    required this.status,
    this.resource,
  });

  final Product product;
  final Resource? resource;
  final EditProductStatus status;

  EditProductState copyWith({
    Product? newProduct,
    EditProductStatus? newStatus,
    Resource? newResource,
  }) {
    return EditProductState(
      product: newProduct ?? product,
      status: newStatus ?? status,
      resource: newResource ?? resource,
    );
  }

  @override
  List<Object?> get props =>
      [product.gtin, status, resource?.name, resource?.resourceUrl];
}
