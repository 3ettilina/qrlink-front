class AddProductResult {
  AddProductResult({required this.type});
  final AddProductResultType type;
}

enum AddProductResultType {
  success(),
  gtinAlreadyExists(message: 'The GTIN provided already exists in the DB'),
  error(message: 'Ha ocurrido un error');

  const AddProductResultType({this.message});

  final String? message;
}
