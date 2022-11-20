import 'package:admin_panel/domain/logic/get_product_details.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_event.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc()
      : super(const ProductDetailsState(status: ProductDetailsStatus.loading)) {
    on<ProductDetailsProductSelected>(_onProductSelected);
    on<ProductDetailsAddResourceTap>(_onAddResourceTap);
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
      emit(state.copyWith(newStatus: ProductDetailsStatus.error));
    }
  }

  void _onAddResourceTap(
    ProductDetailsAddResourceTap event,
    Emitter<ProductDetailsState> emit,
  ) {
    emit(state.copyWith(newStatus: ProductDetailsStatus.addingResource));
  }
}
