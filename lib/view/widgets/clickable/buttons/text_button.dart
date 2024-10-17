import 'package:flutter/material.dart';
import '../../../helpers/consts.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = fontSizeSubTitleMobile,
    this.color = mainColor,
    this.enabled = true,
    this.ddecoration = TextDecoration.none,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final Color color;
  final bool enabled;
  final TextDecoration ddecoration;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          if (enabled) onPressed();
        },
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: size.width * fontSize - 2,
                fontWeight: FontWeight.bold,
                color: color.withOpacity(0.8),
                decoration: ddecoration,
                decorationColor: color.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              width: paddingAllMobile,
            ),
          ],
        ),
      ),
    );
  }
}
