import 'package:flutter/material.dart';

import 'package:components_app/theme/app_theme.dart';

class TextDangerButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const TextDangerButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(primary: AppTheme.dangerColor),
      child: Text(text),
    );
  }
}
