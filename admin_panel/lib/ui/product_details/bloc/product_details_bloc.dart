import 'package:admin_panel/domain/logic/delete_product.dart';
import 'package:admin_panel/domain/logic/delete_resource.dart';
import 'package:admin_panel/domain/logic/get_product_details.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_event.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc()
      : super(const ProductDetailsState(status: ProductDetailsStatus.loading)) {
    on<ProductDetailsProductSelected>(_onProductSelected);
    on<ProductDetailsAddResourceTap>(_onAddResourceTap);
    on<ProductDetailsDeleteProductRequested>(_onDeleteProductRequested);
    on<ProductDetailsDeleteResourceRequested>(_onDeleteResourceRequested);
  }

  Future<void> _onProductSelected(
    ProductDetailsProductSelected event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(state.copyWith(
        newStatus: ProductDetailsStatus.loading, newProduct: null));
    try {
      final product = await GetProductDetails.call(event.gtin);
      if (product != null) {
        emit(state.copyWith(
            newStatus: ProductDetailsStatus.ready,
            newProduct: product,
            newGtin: event.gtin));
      } else {
        emit(state.copyWith(newStatus: ProductDetailsStatus.error));
      }
    } catch (e) {
      _emitError(emit);
    }
  }

  void _onAddResourceTap(
    ProductDetailsAddResourceTap event,
    Emitter<ProductDetailsState> emit,
  ) {
    emit(state.copyWith(newStatus: ProductDetailsStatus.addingResource));
  }

  void _onDeleteProductRequested(
    ProductDetailsDeleteProductRequested event,
    Emitter<ProductDetailsState> emit,
  ) async {
    final result = await DeleteProduct.call(event.gtin);
    if (result) {
      emit(state.copyWith(newStatus: ProductDetailsStatus.productDeleted));
    } else {
      _emitError(emit);
    }
  }

  void _onDeleteResourceRequested(
    ProductDetailsDeleteResourceRequested event,
    Emitter<ProductDetailsState> emit,
  ) async {
    final result = await DeleteResource.call(event.gtin, event.resource);
    if (result) {
      emit(state.copyWith(newStatus: ProductDetailsStatus.resourceDeleted));
    } else {
      _emitError(emit);
    }
  }

  void _emitError(Emitter<ProductDetailsState> emit) =>
      emit(state.copyWith(newStatus: ProductDetailsStatus.error));
}
