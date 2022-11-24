import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  const InputText({
    required this.label,
    this.hintText,
    this.validatorMessage,
    this.initialValue,
    required this.onChange,
    this.allowSpaces = true,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? hintText;
  final String? initialValue;
  final String? validatorMessage;
  final Function(String?) onChange;
  final bool allowSpaces;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        initialValue: initialValue,
        inputFormatters: [
          if (!allowSpaces) FilteringTextInputFormatter.deny(RegExp(r'\s')),
        ],
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
            labelStyle: AppTextStyle.h4,
            floatingLabelStyle: TextStyle(color: AppColors.lile_100),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lile_100, width: 2)),
            border: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: AppTextStyle.h4),
      ),
    );
  }
}
