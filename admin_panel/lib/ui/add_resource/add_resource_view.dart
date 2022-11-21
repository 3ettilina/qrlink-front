import 'package:admin_panel/ui/add_resource/constants/strings.dart';
import 'package:admin_panel/ui/add_resource/widgets/add_form.dart';
import 'package:admin_panel/ui/app/widgets/widgets.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

class AddResourceView extends StatefulWidget {
  const AddResourceView({Key? key}) : super(key: key);

  @override
  State<AddResourceView> createState() => _AddResourceViewState();
}

class _AddResourceViewState extends State<AddResourceView> {
  final _gtin = '9506000134352';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SectionTitle(label: AddResourceStrings.addResource),
              Center(
                child: Text(
                  'GTIN: $_gtin',
                  style: AppTextStyle.h2.copyWith(color: AppColors.mustard),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                  width: 450,
                  child: Card(
                    elevation: 2,
                    color: Colors.white.withOpacity(0.85),
                    child: const AddResource(),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
