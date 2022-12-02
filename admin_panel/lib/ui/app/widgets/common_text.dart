import 'package:admin_panel/ui/app/constants/colors.dart';
import 'package:admin_panel/ui/app/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonText extends StatelessWidget {
  const CommonText(
    this.content, {
    this.style,
    this.copyToClipboard = false,
    Key? key,
  }) : super(key: key);

  final String content;
  final TextStyle? style;
  final bool copyToClipboard;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: copyToClipboard
            ? () async {
                Clipboard.setData(ClipboardData(text: content)).then(
                  (_) {
                    showCommonSnackbar(context,
                        type: SnackbarType.success,
                        message: 'El texto ha sido copiada al porta-papeles.');
                  },
                );
              }
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (copyToClipboard)
              const Icon(
                Icons.copy_outlined,
                size: 15,
                color: AppColors.lile_500,
              ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                content,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
