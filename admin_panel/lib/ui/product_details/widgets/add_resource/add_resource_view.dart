import 'package:admin_panel/ui/add_resource/constants/strings.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/add_resource_form.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_bloc.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddResourceView extends StatelessWidget {
  const AddResourceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddResourceBloc, AddResourceState>(
      listener: (context, state) {
        switch (state.status) {
          case AddResourceStatus.resourceAddedSuccessfully:
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                    backgroundColor: Colors.greenAccent.withOpacity(0.85),
                    content: const Text(
                        AddResourceStrings.resourceAddedSuccesfully)),
              );
            break;
          case AddResourceStatus.resourceAlreadyExistsError:
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                    backgroundColor: Colors.red.withOpacity(0.85),
                    content:
                        const Text(AddResourceStrings.resourceAlreadyExists)),
              );
            break;
          default:
        }
      },
      child: const AddResourceForm(),
    );
  }
}