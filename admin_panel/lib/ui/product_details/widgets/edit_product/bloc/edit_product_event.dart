import 'package:equatable/equatable.dart';

abstract class EditProductEvent extends Equatable {
  const EditProductEvent();

  @override
  List<Object> get props => [];
}

class EditProductEventRequest extends EditProductEvent {
  const EditProductEventRequest({
    required this.gtin,
    required this.name,
    this.resourceUrl,
    this.isOnlyRedirect,
  });

  final String gtin;
  final String name;
  final bool? isOnlyRedirect;
  final String? resourceUrl;
}
