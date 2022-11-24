import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:admin_panel/ui/app/widgets/input_text.dart';
import 'package:admin_panel/ui/app/widgets/common_button.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/bloc/edit_product_bloc.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/bloc/edit_product_event.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/bloc/edit_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductForm extends StatefulWidget {
  const EditProductForm({
    required this.resourceName,
    required this.resourceUrl,
    required this.onlyRedirect,
    Key? key,
  }) : super(key: key);

  final String resourceName;
  final String resourceUrl;
  final bool onlyRedirect;

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? url;
  bool? redirect;
  bool isSubmitEnabled = false;

  @override
  void initState() {
    name = widget.resourceName;
    url = widget.resourceUrl;
    redirect = widget.onlyRedirect;
    super.initState();
  }

  void update({
    String? newResourceUrl,
    bool? newOnlyRedirect,
  }) {
    setState(() {
      url = newResourceUrl ?? url;
      redirect = newOnlyRedirect ?? redirect;
      isSubmitEnabled = (name != null || url != null || redirect != null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProductBloc>();
    final state = bloc.state;

    return BlocListener<EditProductBloc, EditProductState>(
        listener: (context, state) {
          if (state.status == EditProductStatus.success) {
            _formKey.currentState?.reset();
          }
        },
        child: Card(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                'Solo redirección de recursos',
                                style: AppTextStyle.h2,
                              )),
                              Switch(
                                  value: redirect ?? state.product.onlyRedirect,
                                  onChanged: (value) =>
                                      update(newOnlyRedirect: value)),
                            ],
                          ),
                          SizedBox(height: 7),
                          Text(
                            state.resource!.name,
                            style: AppTextStyle.h2,
                          ),
                          const SizedBox(height: 20),
                          InputText(
                            label: 'URL del recurso',
                            initialValue: state.resource?.resourceUrl,
                            hintText:
                                'Ej: https://www.wildfooduk.com/mushroom-guide/',
                            onChange: (value) => update(newResourceUrl: value),
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
                      const Spacer(),
                      CommonButton(
                          isEnabled: isSubmitEnabled,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              bloc.add(EditProductEventRequest(
                                gtin: state.product.gtin,
                                name: name!,
<<<<<<< HEAD
                                resourceUrl:
                                    url == widget.resourceUrl ? null : url,
                                isOnlyRedirect: redirect == widget.onlyRedirect
                                    ? null
                                    : redirect,
=======
                                resourceUrl: url!,
                                isOnlyRedirect: redirect ?? false,
>>>>>>> 7825607 ([TASK-99] Agregar Switch onlyRedirect - + Mejoras)
                              ));
                            }
                          },
                          label: 'Editar'),
                    ],
                  )
                ])));
  }
}
