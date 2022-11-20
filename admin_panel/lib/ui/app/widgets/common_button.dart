import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    this.label,
    this.content,
    required this.onTap,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  final String? label;
  final Widget? content;
  final VoidCallback onTap;
  final bool isEnabled;

  Widget _child() {
    assert(label != null || content != null);
    if (label != null) {
      return Text(label!, style: AppTextStyle.h2);
    } else {
      return content!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        color: isEnabled ? AppColors.mustard_75 : AppColors.lile_600_15,
        alignment: Alignment.center,
        child: _child(),
      ),
    );
  }
}
