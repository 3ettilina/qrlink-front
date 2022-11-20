import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    required this.label,
    this.hintText,
    this.validatorMessage,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? hintText;
  final String? validatorMessage;
  final Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      validator: (value) {
        if (validatorMessage != null && (value == null || value.isEmpty)) {
          return validatorMessage;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          floatingLabelStyle: TextStyle(color: AppColors.lile_100),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lile_100, width: 2)),
          border: const OutlineInputBorder(),
          hintText: hintText),
    );
  }
}
