import 'package:admin_panel/domain/logic/products_logic.dart';
import 'package:admin_panel/domain/result/add_resource_result.dart';
import 'package:admin_panel/ui/constants/colors.dart';
import 'package:flutter/material.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final linkTypeTextController = TextEditingController();
  final languageTextController = TextEditingController();
  final urlTextController = TextEditingController();

  final _gtin = '9506000134352';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre para el recurso';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Nombre del recurso',
                    floatingLabelStyle: TextStyle(color: AppColors.lile_100),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.lile_100, width: 2)),
                    border: OutlineInputBorder(),
                    hintText: 'Ej: Receta'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: linkTypeTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un tipo de link';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Tipo de link',
                    floatingLabelStyle: TextStyle(color: AppColors.lile_100),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.lile_100, width: 2)),
                    border: OutlineInputBorder(),
                    hintText: 'Ej: gs1:recipeInfo'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: languageTextController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Idioma del recurso',
                    floatingLabelStyle: TextStyle(color: AppColors.lile_100),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.lile_100, width: 2)),
                    border: OutlineInputBorder(),
                    hintText: 'Ej: en'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: urlTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una URL';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'URL del recurso',
                    floatingLabelStyle: TextStyle(color: AppColors.lile_100),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.lile_100, width: 2)),
                    border: OutlineInputBorder(),
                    hintText: 'Ej: https://www.wildfooduk.com/mushroom-guide/'),
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                color: Colors.green.withOpacity(0.85),
                hoverColor: Colors.indigo.withOpacity(0.25),
                elevation: 1,
                hoverElevation: 8.0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.indigo,
                          content: Text('Agregando recurso al producto...')),
                    );
                    final result = await ProductsLogic.addResourceToProduct(
                      gtin: _gtin, // TODO(betti): get by selected product
                      resourceName: nameTextController.text,
                      resourceLinkType: linkTypeTextController.text,
                      resourceLanguage: languageTextController.text,
                      resourceUrl: urlTextController.text,
                    );

                    switch (result.type) {
                      case AddResourceResultType.success:
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(
                            SnackBar(
                                backgroundColor:
                                    Colors.greenAccent.withOpacity(0.85),
                                content: Text('Recurso agregado')),
                          );
                        _formKey.currentState?.reset();
                        break;
                      case AddResourceResultType.alreadyExist:
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.red.withOpacity(0.85),
                                content: Text(result.type.message ?? '')),
                          );
                        break;
                      default:
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(
                            SnackBar(
                                backgroundColor:
                                    Colors.redAccent.withOpacity(0.85),
                                content: Text(result.type.message ?? '')),
                          );
                        break;
                    }
                  }
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.add_link,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Agregar recurso',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
