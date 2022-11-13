import 'package:admin_panel/ui/constants/colors.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({
    required this.label,
    this.hintText,
    this.validatorMessage,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? hintText;
  final String? validatorMessage;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
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
