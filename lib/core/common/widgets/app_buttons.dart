import 'package:assesment_app/core/extension/responsive_extension.dart';
import 'package:assesment_app/core/utils/themes/font_manager.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: context.screenWidth / 1.4,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: FontManagerStyle().buttonTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
