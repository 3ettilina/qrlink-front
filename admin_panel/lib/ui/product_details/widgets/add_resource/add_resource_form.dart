import 'package:admin_panel/ui/add_resource/widgets/input_text.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:admin_panel/ui/app/widgets/common_button.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_bloc.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_event.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddResourceForm extends StatefulWidget {
  const AddResourceForm({Key? key}) : super(key: key);

  @override
  State<AddResourceForm> createState() => _AddResourceFormState();
}

class _AddResourceFormState extends State<AddResourceForm> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? linkType;
  String? language;
  String? resourceUrl;
  bool isSubmitEnabled = false;

  void updateText({
    String? newName,
    String? newLinkType,
    String? newLanguage,
    String? newResourceUrl,
  }) {
    setState(() {
      name = newName ?? name;
      linkType = newLinkType ?? linkType;
      language = newLanguage ?? language;
      resourceUrl = newResourceUrl ?? resourceUrl;
      isSubmitEnabled = (name != null && resourceUrl != null) &&
          (language != null || resourceUrl != null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddResourceBloc>();
    final state = bloc.state;
    return BlocListener<AddResourceBloc, AddResourceState>(
      listener: (context, state) {
        if (state.status == AddResourceStatus.resourceAddedSuccessfully) {
          _formKey.currentState?.reset();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                'Nuevo recurso',
                style: AppTextStyle.h2,
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: FocusTraversalGroup(
                  policy: OrderedTraversalPolicy(),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: InputText(
                          label: 'Nombre del recurso',
                          hintText: 'Ej: Receta',
                          validatorMessage:
                              'Por favor ingresa un nombre para el recurso',
                          onChange: (value) => updateText(newName: value),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        flex: 2,
                        child: InputText(
                          label: 'Tipo de link',
                          hintText: 'Ej: gs1:recipeInfo',
                          validatorMessage: 'Por favor ingresa un tipo de link',
                          onChange: (value) => updateText(newLinkType: value),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        flex: 2,
                        child: InputText(
                            label: 'Idioma del recurso',
                            hintText: 'Ej: en',
                            onChange: (value) =>
                                updateText(newLanguage: value)),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        flex: 2,
                        child: InputText(
                          label: 'URL del recurso',
                          hintText:
                              'Ej: https://www.wildfooduk.com/mushroom-guide/',
                          validatorMessage: 'Por favor ingresa una URL',
                          onChange: (value) =>
                              updateText(newResourceUrl: value),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: CommonButton(
                              isEnabled: isSubmitEnabled,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  bloc.add(AddResourceEventRequest(
                                    gtin: state.gtin,
                                    name: name!,
                                    resourceUrl: resourceUrl!,
                                    language: language,
                                    linkType: linkType,
                                  ));
                                }
                              },
                              content:
                                  Center(child: Icon(Icons.add, size: 25)))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
