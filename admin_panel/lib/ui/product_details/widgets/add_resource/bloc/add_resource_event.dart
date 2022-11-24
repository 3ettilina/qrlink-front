import 'package:equatable/equatable.dart';

abstract class AddResourceEvent extends Equatable {
  const AddResourceEvent();

  @override
  List<Object> get props => [];
}

class AddResourceEventFetchLinkTypes extends AddResourceEvent {
  const AddResourceEventFetchLinkTypes();
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

class AddResourceEventSuccessful extends AddResourceEvent {
  const AddResourceEventSuccessful({
    required this.name,
  });

  final String name;
}

class AddResourceEventAlreadyExists extends AddResourceEvent {
  const AddResourceEventAlreadyExists({
    required this.gtin,
    required this.name,
  });

  final String gtin;
  final String name;
}
