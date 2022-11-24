import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/ui/app/widgets/common_button.dart';
import 'package:admin_panel/ui/app/widgets/custom_snackbar.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_bloc.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_event.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourcesListItemContent extends StatelessWidget {
  const ResourcesListItemContent({required this.resource, Key? key})
      : super(key: key);

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsBloc>();
    final state = cubit.state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(flex: 6, child: Text(resource.name)),
        Expanded(flex: 2, child: Text(resource.language ?? '')),
        Expanded(flex: 4, child: Text(resource.linkType ?? '')),
        Expanded(flex: 6, child: Text(resource.resourceUrl)),
        Expanded(
            flex: 2,
            child: CommonButton(
                onTap: () {
                  cubit.add(
                    ProductDetailsDeleteResourceRequested(
                        gtin: state.gtin!, resource: resource),
                  );
                  showCommonSnackbar(
                    context,
                    message: 'Eliminando recurso...',
                    type: SnackbarType.info,
                  );
                },
                content: const Icon(Icons.delete))),
      ],
    );
  }
}
