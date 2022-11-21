import 'package:admin_panel/domain/logic/get_products_list.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc()
      : super(const ProductsListState(status: ProductsListStatus.initial)) {
    on<ProductsListFetchRequested>(_onProductsListRequested);
  }

  Future<void> _onProductsListRequested(
    ProductsListFetchRequested event,
    Emitter<ProductsListState> emit,
  ) async {
    // Set loading state
    emit(state.copyWith(status: ProductsListStatus.loading));

    try {
      final products = await GetProductsList.call();

      emit(state.copyWith(
          status: ProductsListStatus.success, products: products));
    } catch (e) {
      emit(state.copyWith(status: ProductsListStatus.error));
    }
  }
}
