import 'package:admin_panel/domain/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class ProductDetailsProductSelected extends ProductDetailsEvent {
  const ProductDetailsProductSelected({
    required this.gtin,
  });

  final String gtin;

  @override
  List<Object> get props => [gtin];
}

class ProductDetailsAddResourceTap extends ProductDetailsEvent {
  const ProductDetailsAddResourceTap();

  @override
  List<Object> get props => [];
}

class ProductDetailsDeleteProductRequested extends ProductDetailsEvent {
  const ProductDetailsDeleteProductRequested({
    required this.gtin,
  });

  final String gtin;

  @override
  List<Object> get props => [gtin];
}

class ProductDetailsDeleteResourceRequested extends ProductDetailsEvent {
  const ProductDetailsDeleteResourceRequested({
    required this.gtin,
    required this.resource,
  });

  final String gtin;
  final Resource resource;

  @override
  List<Object> get props => [gtin, resource.name];
}
