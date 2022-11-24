import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:admin_panel/ui/app/widgets/dialog/common_modal_content.dart';
import 'package:flutter/material.dart';

Future<bool> showCommonDialog(
  BuildContext context, {
  String? title,
  String? description,
  Widget? content,
  String? primaryActionText,
  String? secondaryActionText,
  VoidCallback? primaryOnTap,
  VoidCallback? secondaryOnTap,
  AnimationController? animationController,
  double? heightPercentage,
  double heightPercentageWithKeyboardOpen = 0.85,
  Alignment alignment = Alignment.center,
  bool useRootNavigator = false,
  bool applySafeArea = false,
}) async {
  final result = await showAlertDialog<bool?>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (context, widget) => WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, false);
        secondaryOnTap?.call();
        return false;
      },
      child: CommonModalContent(
        title: title,
        content: content,
        description: description,
        primaryOnTap: primaryOnTap,
        primaryActionText: primaryActionText,
        secondaryActionText: secondaryActionText,
        secondaryOnTap: secondaryOnTap,
        heightPercentage: heightPercentage,
        heightPercentageWithKeyboardOpen: heightPercentageWithKeyboardOpen,
        alignment: alignment,
        applySafeArea: applySafeArea,
      ),
    ),
  );

  return result ?? false;
}
