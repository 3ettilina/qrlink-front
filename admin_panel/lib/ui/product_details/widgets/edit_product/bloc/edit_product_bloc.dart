import 'package:admin_panel/domain/logic/edit_product.dart';
import 'package:admin_panel/domain/logic/edit_resource.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/bloc/edit_product_event.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/bloc/edit_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  EditProductBloc(Product product, Resource resource)
      : super(EditProductState(
          product: product,
          resource: resource,
          status: EditProductStatus.initial,
        )) {
    on<EditProductEventRequest>(_onEditProductEventEditProductRequested);
  }

  Future<void> _onEditProductEventEditProductRequested(
    EditProductEventRequest event,
    Emitter<EditProductState> emit,
  ) async {
    emit(state.copyWith(newStatus: EditProductStatus.editing));

    try {
      final result = await EditProduct.call(
          gtin: event.gtin,
          resourceName: event.name,
          isOnlyRedirect: event.isOnlyRedirect,
          resourceUrl: event.resourceUrl);

      if (result) {
        emit(state.copyWith(newStatus: EditProductStatus.success));
      } else {
        emit(state.copyWith(newStatus: EditProductStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(newStatus: EditProductStatus.error));
    }
  }
}
