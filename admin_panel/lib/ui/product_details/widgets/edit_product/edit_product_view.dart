import 'package:admin_panel/ui/app/widgets/custom_snackbar.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/bloc/edit_product_bloc.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/bloc/edit_product_state.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/edit_product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProductBloc, EditProductState>(
      listener: (context, state) {
        switch (state.status) {
          case EditProductStatus.editing:
            showCommonSnackbar(context,
                message: 'Editando producto', type: SnackbarType.info);
            break;
          case EditProductStatus.success:
            showCommonSnackbar(
              context,
              message: 'Producto editado con éxito',
              type: SnackbarType.success,
            );
            Navigator.pop(context, true);
            break;
          case EditProductStatus.error:
            showCommonSnackbar(context,
                message: 'Ocurrió un problema al editar el producto',
                type: SnackbarType.failure);
            break;
          default:
        }
      },
      builder: (context, state) => EditProductForm(
        resourceName: state.resource?.name ?? '',
        resourceUrl: state.resource?.resourceUrl ?? '',
        onlyRedirect: state.product.onlyRedirect,
      ),
    );
  }
}
