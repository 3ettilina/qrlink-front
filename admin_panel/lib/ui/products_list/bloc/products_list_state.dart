part of 'products_list_bloc.dart';

enum ProductsListStatus { initial, loading, success, error }

class ProductsListState extends Equatable {
  const ProductsListState({
    required this.status,
    this.products = const [],
  });

  final ProductsListStatus status;
  final List<Product> products;

  ProductsListState copyWith({
    ProductsListStatus? status,
    List<Product>? products,
  }) {
    return ProductsListState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [status, products];
}
