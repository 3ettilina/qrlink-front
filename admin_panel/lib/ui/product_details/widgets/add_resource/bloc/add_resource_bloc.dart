import 'package:admin_panel/domain/logic/add_resource_to_product.dart';
import 'package:admin_panel/domain/logic/get_languages.dart';
import 'package:admin_panel/domain/logic/get_link_types_list.dart';
import 'package:admin_panel/domain/result/add_resource_result.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_event.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddResourceBloc extends Bloc<AddResourceEvent, AddResourceState> {
  AddResourceBloc(String gtin)
      : super(AddResourceState(
          gtin: gtin,
          status: AddResourceStatus.ready,
          linkTypes: const [],
          languages: const [],
        )) {
    on<AddResourceEventFetchData>(_onAddResourceEventFetchLinkTypes);
    on<AddResourceEventRequest>(_onAddResourceEventRequest);
  }

  Future<void> _onAddResourceEventFetchLinkTypes(
    AddResourceEventFetchData event,
    Emitter<AddResourceState> emit,
  ) async {
    emit(state.copyWith(newStatus: AddResourceStatus.loading));
    final linkTypes = await GetLinkTypeList.call();
    final languages = await GetLanguages.call();

    emit(state.copyWith(
      newStatus: AddResourceStatus.ready,
      newLinkTypes: linkTypes,
      newLanguages: languages,
    ));
  }

  Future<void> _onAddResourceEventRequest(
    AddResourceEventRequest event,
    Emitter<AddResourceState> emit,
  ) async {
    emit(state.copyWith(newStatus: AddResourceStatus.addingResource));
    // One of both has to be set
    if (event.language != null || event.linkType != null) {
      final result = await AddResourceToProduct.call(
          gtin: event.gtin,
          resourceName: event.name,
          resourceLinkType: event.linkType,
          resourceLanguage: event.language,
          resourceUrl: event.resourceUrl);

      switch (result.type) {
        case AddResourceResultType.success:
          emit(state.copyWith(
              newStatus: AddResourceStatus.resourceAddedSuccessfully));
          break;
        case AddResourceResultType.alreadyExist:
          emit(state.copyWith(
              newStatus: AddResourceStatus.resourceAlreadyExistsError));
          break;
        default:
          emit(state.copyWith(newStatus: AddResourceStatus.error));
      }
    }
  }
}
