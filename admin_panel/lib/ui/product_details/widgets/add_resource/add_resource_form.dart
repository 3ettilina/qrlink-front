import 'package:admin_panel/domain/models/language.dart';
import 'package:admin_panel/domain/models/link_type.dart';
import 'package:admin_panel/ui/app/widgets/dropdown.dart';
import 'package:admin_panel/ui/app/widgets/input_text.dart';
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
  LinkType? linkType;
  Language? language;
  String? resourceUrl;
  bool isSubmitEnabled = false;

  void updateText({
    String? newName,
    LinkType? newLinkType,
    Language? newLanguage,
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
    return BlocConsumer<AddResourceBloc, AddResourceState>(
        listener: (context, state) {
      if (state.status == AddResourceStatus.resourceAddedSuccessfully) {
        _formKey.currentState?.reset();
      }
    }, builder: (context, state) {
      final bloc = context.read<AddResourceBloc>();
      return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: FocusTraversalGroup(
                    policy: OrderedTraversalPolicy(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InputText(
                          label: 'Nombre del recurso',
                          hintText: 'Ej: Receta',
                          validatorMessage:
                              'Por favor ingresa un nombre para el recurso',
                          onChange: (value) => updateText(newName: value),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                  child: DropDown<Language>(
                                label: 'Idioma del recurso',
                                items: state.languages,
                                itemContent: (lang) => Text(
                                  '${lang.name} (${lang.code})',
                                  style: AppTextStyle.h2
                                      .copyWith(color: AppColors.lile_600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onSelected: (value) =>
                                    updateText(newLanguage: value),
                              )),
                              const SizedBox(width: 5),
                              Expanded(
                                  flex: 2,
                                  child: DropDown<LinkType>(
                                    label: 'Seleccionar link-type',
                                    items: state.linkTypes,
                                    itemContent: (linkType) => Text(
                                      '${linkType.name} (${linkType.id})',
                                      style: AppTextStyle.h2
                                          .copyWith(color: AppColors.lile_600),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    onSelected: (value) =>
                                        updateText(newLinkType: value),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 7),
                        InputText(
                          label: 'URL del recurso',
                          hintText:
                              'Ej: https://www.wildfooduk.com/mushroom-guide/',
                          validatorMessage: 'Por favor ingresa una URL',
                          onChange: (value) =>
                              updateText(newResourceUrl: value),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    CommonButton(
                        onTap: () => Navigator.pop(context, false),
                        label: 'Cancelar'),
                    Spacer(),
                    CommonButton(
                        isEnabled: isSubmitEnabled,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            bloc.add(AddResourceEventRequest(
                              gtin: state.gtin,
                              name: name!,
                              resourceUrl: resourceUrl!,
                              language: language?.code,
                              linkType: linkType?.id,
                            ));
                          }
                        },
                        label: 'Agregar'),
                  ],
                )
              ]));
    });
  }
}
