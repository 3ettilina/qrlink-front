import 'package:admin_panel/domain/models/models.dart';
import 'package:equatable/equatable.dart';

enum AddResourceStatus {
  loading,
  resourceAddedSuccessfully,
  resourceAlreadyExistsError,
  error
}

class AddResourceState extends Equatable {
  const AddResourceState({
    required this.status,
    required this.gtin,
    this.resource,
  });

  final Resource? resource;
  final String gtin;
  final AddResourceStatus status;

  AddResourceState copyWith({
    AddResourceStatus? newStatus,
    Resource? newResource,
  }) {
    return AddResourceState(
      status: newStatus ?? status,
      gtin: gtin,
      resource: newResource ?? resource,
    );
  }

  @override
  List<Object?> get props => [status, resource?.name, resource?.resourceUrl];
}
