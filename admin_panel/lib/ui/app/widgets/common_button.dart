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
    return ElevatedButton(
      onPressed: isEnabled ? onTap : null,
      child: Center(child: _child()),
    );
  }
}
