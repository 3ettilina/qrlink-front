import 'package:admin_panel/domain/models/models.dart';
import 'package:equatable/equatable.dart';

enum AddResourceStatus {
  loading,
  ready,
  addingResource,
  resourceAddedSuccessfully,
  resourceAlreadyExistsError,
  editingProduct,
  productEdited,
  productEditError,
  error
}

class AddResourceState extends Equatable {
  const AddResourceState({
    required this.gtin,
    required this.status,
    required this.linkTypes,
    required this.languages,
    this.resource,
  });

  final String gtin;
  final Resource? resource;
  final List<LinkType> linkTypes;
  final List<Language> languages;
  final AddResourceStatus status;

  AddResourceState copyWith({
    String? newGtin,
    AddResourceStatus? newStatus,
    List<LinkType>? newLinkTypes,
    List<Language>? newLanguages,
    Resource? newResource,
  }) {
    return AddResourceState(
      gtin: newGtin ?? gtin,
      status: newStatus ?? status,
      linkTypes: newLinkTypes ?? linkTypes,
      languages: newLanguages ?? languages,
      resource: newResource ?? resource,
    );
  }

  @override
  List<Object?> get props =>
      [gtin, status, resource?.name, resource?.resourceUrl];
}
