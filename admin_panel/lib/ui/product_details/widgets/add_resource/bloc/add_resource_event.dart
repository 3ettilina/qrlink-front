import 'package:equatable/equatable.dart';

abstract class AddResourceEvent extends Equatable {
  const AddResourceEvent();

  @override
  List<Object> get props => [];
}

class AddResourceEventFetchData extends AddResourceEvent {
  const AddResourceEventFetchData();
}

class AddResourceEventRequest extends AddResourceEvent {
  const AddResourceEventRequest({
    required this.gtin,
    required this.name,
    this.language,
    this.linkType,
    required this.resourceUrl,
  });

  final String gtin;
  final String name;
  final String? language;
  final String? linkType;
  final String resourceUrl;
}

class EditProductEventEditProductRequest extends AddResourceEvent {
  const EditProductEventEditProductRequest({
    required this.gtin,
    required this.name,
    required this.resourceUrl,
  });

  final String gtin;
  final String name;
  final String resourceUrl;
}
