import 'package:admin_panel/domain/models/models.dart';
import 'package:equatable/equatable.dart';

enum AddResourceStatus {
  loading,
  ready,
  addingResource,
  resourceAddedSuccessfully,
  resourceAlreadyExistsError,
  error
}

class AddResourceState extends Equatable {
  const AddResourceState({
    required this.status,
    required this.gtin,
    required this.linkTypes,
    this.resource,
  });

  final Resource? resource;
  final List<LinkType> linkTypes;
  final String gtin;
  final AddResourceStatus status;

  AddResourceState copyWith({
    AddResourceStatus? newStatus,
    List<LinkType>? newLinkTypes,
    Resource? newResource,
  }) {
    return AddResourceState(
      status: newStatus ?? status,
      gtin: gtin,
      linkTypes: newLinkTypes ?? linkTypes,
      resource: newResource ?? resource,
    );
  }

  @override
  List<Object?> get props => [status, resource?.name, resource?.resourceUrl];
}
