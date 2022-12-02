import 'package:admin_panel/ui/add_product/widgets/add_product_form.dart';
import 'package:admin_panel/ui/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const SectionTitle(label: 'Agregar producto'),
          SizedBox(
              width: 450,
              child: Card(
                elevation: 2,
                color: Colors.white.withOpacity(0.85),
                child: const AddProductForm(),
              )),
        ],
      ),
    );
  }
}
