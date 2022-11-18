import 'package:admin_panel/domain/logic/add_resource_to_product.dart';
import 'package:admin_panel/domain/result/add_resource_result.dart';
import 'package:admin_panel/ui/add_resource/constants/strings.dart';
import 'package:admin_panel/ui/add_resource/widgets/input_text.dart';
import 'package:flutter/material.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();

  final _gtin = '9506000134352';

  String name = '';
  String linkType = '';
  String language = '';
  String resourceUrl = '';

  void updateText({
    String? name,
    String? linkType,
    String? language,
    String? resourceUrl,
  }) {
    setState(() {
      name = name;
      name = linkType;
      name = language;
      resourceUrl = resourceUrl;
    });
  }

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
              InputText(
                label: 'Nombre del recurso',
                hintText: 'Ej: Receta',
                validatorMessage: 'Por favor ingresa un nombre para el recurso',
                onChange: (value) => updateText(name: value),
              ),
              const SizedBox(height: 20),
              InputText(
                label: 'Tipo de link',
                hintText: 'Ej: gs1:recipeInfo',
                validatorMessage: 'Por favor ingresa un tipo de link',
                onChange: (value) => updateText(linkType: value),
              ),
              const SizedBox(height: 20),
              InputText(
                label: 'Idioma del recurso',
                hintText: 'Ej: en',
                onChange: (value) => updateText(language: value),
              ),
              const SizedBox(height: 20),
              InputText(
                label: 'URL del recurso',
                hintText: 'Ej: https://www.wildfooduk.com/mushroom-guide/',
                validatorMessage: 'Por favor ingresa una URL',
                onChange: (value) => updateText(resourceUrl: value),
              ),
              const SizedBox(height: 50),
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
                          content: Text(AddResourceStrings.addingResource)),
                    );
                    final result = await AddResourceToProduct.call(
                      gtin: _gtin, // TODO(betti): get by selected product
                      resourceName: name,
                      resourceLinkType: linkType,
                      resourceLanguage: language,
                      resourceUrl: resourceUrl,
                    );

                    switch (result.type) {
                      case AddResourceResultType.success:
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(
                            SnackBar(
                                backgroundColor:
                                    Colors.greenAccent.withOpacity(0.85),
                                content: const Text(AddResourceStrings
                                    .resourceAddedSuccesfully)),
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
                    SizedBox(width: 10),
                    Text(
                      AddResourceStrings.addResource,
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
