import 'package:admin_panel/ui/add_resource/constants/strings.dart';
import 'package:admin_panel/ui/add_resource/widgets/input_text.dart';
import 'package:admin_panel/ui/app/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';

class AddResource extends StatefulWidget {
  const AddResource({Key? key}) : super(key: key);

  @override
  State<AddResource> createState() => _AddResourceFormState();
}

class _AddResourceFormState extends State<AddResource> {
  final _formKey = GlobalKey<FormState>();

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
          child: Row(
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
                    showCommonSnackbar(
                      context,
                      message: AddResourceStrings.addingResource,
                      type: SnackbarType.info,
                    );
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
