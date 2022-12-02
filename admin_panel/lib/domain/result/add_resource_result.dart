class AddResourceResult {
  AddResourceResult({required this.type});
  final AddResourceResultType type;
}

enum AddResourceResultType {
  success(),
  alreadyExist(
      message:
          'Ya existe un recurso con ese linkType e idioma. Por favor corrija.'),
  notFound(message: 'No se encontró el producto.'),
  error(message: 'Ha ocurrido un error :(');

  const AddResourceResultType({this.message});

  final String? message;
}
