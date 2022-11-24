import 'package:admin_panel/ui/app/widgets/dialog/common_modal_bottom_actions.dart';
import 'package:admin_panel/ui/app/widgets/dialog/common_modal_header.dart';
import 'package:flutter/material.dart';

final _shapeBorder =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));

class CommonModalContent extends StatelessWidget {
  const CommonModalContent({
    Key? key,
    this.title,
    this.description,
    this.content,
    this.primaryActionText,
    this.primaryOnTap,
    this.secondaryActionText,
    this.secondaryOnTap,
    this.heightPercentage,
    this.heightPercentageWithKeyboardOpen,
    this.alignment = Alignment.center,
    this.applySafeArea = true,
  }) : super(key: key);

  final String? title;
  final String? description;
  final Widget? content;
  final String? primaryActionText;
  final String? secondaryActionText;
  final VoidCallback? primaryOnTap;
  final VoidCallback? secondaryOnTap;
  final double? heightPercentage;
  final double? heightPercentageWithKeyboardOpen;
  final bool applySafeArea;

  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: _shapeBorder,
        child: AnimatedContainer(
          height: MediaQuery.of(context).size.height * 0.5,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          alignment: alignment,
          child: Column(
            children: [
              // GRABBER + CENTER TITLE
              _childWithPadding(child: CommonModalHeader(title: title)),
              // CONTENT
              if (description != null)
                Center(
                  child: Text(
                    description!,
                    textAlign: TextAlign.center,
                  ),
                ),
              // CUSTOM CONTENT
              if (content != null) content!,

              // BOTTOM ACTIONS
              if (primaryActionText != null) ...[
                const Spacer(flex: 2),
                _childWithPadding(
                  child: CommonModalBottomActions(
                    primaryOnTap: primaryOnTap,
                    primaryActionText: primaryActionText ?? '',
                    secondaryActionText: secondaryActionText,
                    secondaryOnTap: secondaryOnTap,
                  ),
                ),
                const SizedBox(height: 8.0),
              ]
            ],
          ),
        ));
  }

  Widget _childWithPadding({required Widget child}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: child,
      );
}
