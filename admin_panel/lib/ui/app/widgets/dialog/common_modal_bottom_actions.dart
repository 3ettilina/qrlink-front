import 'package:admin_panel/ui/app/widgets/common_button.dart';
import 'package:flutter/material.dart';

class CommonModalBottomActions extends StatelessWidget {
  const CommonModalBottomActions({
    Key? key,
    this.primaryActionText,
    this.primaryOnTap,
    this.secondaryActionText,
    this.secondaryOnTap,
    this.primaryOnTapPopNav = true,
    this.secondaryOnTapPopNav = true,
  }) : super(key: key);

  final String? primaryActionText;
  final String? secondaryActionText;
  final VoidCallback? primaryOnTap;
  final VoidCallback? secondaryOnTap;
  final bool primaryOnTapPopNav;
  final bool secondaryOnTapPopNav;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Only show second button if its text is not null
        if (secondaryActionText != null)
          CommonButton(
            label: secondaryActionText!,
            onTap: () {
              if (secondaryOnTapPopNav) Navigator.pop(context, false);
              secondaryOnTap?.call();
            },
          ),
        const Spacer(),
        // Only show primary button if its text is not null
        if (primaryActionText != null)
          CommonButton(
            label: primaryActionText!,
            onTap: () {
              if (primaryOnTapPopNav) Navigator.pop(context, true);
              primaryOnTap?.call();
            },
          ),
      ],
    );
  }
}
