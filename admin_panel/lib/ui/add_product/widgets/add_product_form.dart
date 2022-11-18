import 'package:admin_panel/domain/logic/add_product.dart';
import 'package:admin_panel/domain/result/add_product_result.dart';
import 'package:admin_panel/ui/add_resource/constants/strings.dart';
import 'package:admin_panel/ui/add_resource/widgets/input_text.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();

  String _gtin = '';
  String _name = '';
  bool _onlyRedirect = false;
  String _resourceUrl = '';

  void updateText({
    String? gtin,
    String? name,
    bool onlyRedirect = false,
    String? resourceUrl,
  }) {
    setState(() {
      if (gtin != null) {
        _gtin = gtin;
      }
      if (name != null) {
        _name = name;
      }
      if (onlyRedirect != false) {
        _onlyRedirect = onlyRedirect;
      }
      if (resourceUrl != null) {
        _resourceUrl = resourceUrl;
      }
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
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Solo redirección de recursos',
                    style: AppTextStyle.subHeader,
                  )),
                  Switch(
                      value: _onlyRedirect,
                      onChanged: (value) => updateText(onlyRedirect: value)),
                ],
              ),
              InputText(
                label: 'Nombre del producto',
                hintText: 'Ej: Salsa de tomate',
                validatorMessage:
                    'Por favor ingresa un nombre para el producto',
                onChange: (value) => updateText(name: value),
              ),
              const SizedBox(height: 20),
              InputText(
                label: 'Código GTIN',
                hintText: 'Ej: 2637288989',
                validatorMessage: 'Por favor ingresa un código para el GTIN',
                onChange: (value) => updateText(gtin: value),
              ),
              const SizedBox(height: 20),
              InputText(
                label: 'URL por defecto del producto',
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
                    final result = await AddProduct.call(
                      gtin: _gtin,
                      name: _name,
                      onlyRedirect:
                          _onlyRedirect, // TODO(betti) set with Switch
                      resourceUrl: _resourceUrl,
                    );

                    switch (result.type) {
                      case AddProductResultType.success:
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
                      case AddProductResultType.gtinAlreadyExists:
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
                      AddResourceStrings.addProduct,
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
