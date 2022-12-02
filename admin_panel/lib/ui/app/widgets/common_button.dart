import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

enum CommonButtonType {
  success(Colors.green),
  info(Colors.blueAccent),
  warning(Colors.deepOrangeAccent),
  alert(Colors.redAccent),
  common(AppColors.lile_500);

  const CommonButtonType(this.buttonColor);

  final Color buttonColor;
}

class CommonButton extends StatelessWidget {
  const CommonButton({
    this.label,
    this.content,
    required this.onTap,
    this.isEnabled = true,
    this.type = CommonButtonType.common,
    this.width,
    Key? key,
  }) : super(key: key);

  final String? label;
  final Widget? content;
  final VoidCallback onTap;
  final bool isEnabled;
  final CommonButtonType type;
  final double? width;

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
    return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: isEnabled ? onTap : null,
        color: type.buttonColor,
        textColor: Colors.white,
        child: Container(alignment: Alignment.center, child: _child()),
      ),
    );
  }
}
