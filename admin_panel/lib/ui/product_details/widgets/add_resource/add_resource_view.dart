import 'package:admin_panel/ui/app/widgets/common_loading.dart';
import 'package:admin_panel/ui/product_details/constants/strings.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/add_resource_form.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_bloc.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_event.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddResourceView extends StatelessWidget {
  const AddResourceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddResourceBloc>();
    bloc.add(const AddResourceEventFetchLinkTypes());
    return BlocConsumer<AddResourceBloc, AddResourceState>(
        listener: (context, state) {
      switch (state.status) {
        case AddResourceStatus.resourceAddedSuccessfully:
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                  backgroundColor: Colors.greenAccent.withOpacity(0.85),
                  content: const Text(
                      ProductDetailsStrings.resourceAddedSuccesfully)),
            );
          break;
        case AddResourceStatus.resourceAlreadyExistsError:
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                  backgroundColor: Colors.red.withOpacity(0.85),
                  content:
                      const Text(ProductDetailsStrings.resourceAlreadyExists)),
            );
          break;
        default:
      }
    }, builder: (context, state) {
      if (state.status == AddResourceStatus.ready) {
        return const AddResourceForm();
      }
      return const CommonLoader();
    });
  }
}
