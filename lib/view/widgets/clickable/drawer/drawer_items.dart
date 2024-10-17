import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../controller/providers/theme_provider.dart';
import '../../../helpers/consts.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed,  required this.color});
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
      final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return InkWell(
      focusColor: greyTextColor.withOpacity(0.5),
      splashColor: greyTextColor.withOpacity(0.5),
      onTap: onPressed,
      child: Padding(
              padding: const EdgeInsets.fromLTRB(sizedBoxNotSameComponentsMobile, sizedBoxSameComponentsMobile, 0, 0),
        child: Row(
          children: [
            Icon(
              icon,
              size: iconSizeMobile-5,
              color: color,
            ),
            const SizedBox(
              width: sizedBoxNotSameComponentsMobile-5,
            ),
            Text(
              title,
              style:  TextStyle(
                  fontSize:size.width * fontSizeBodyMobile,
                  fontWeight: FontWeight.bold,
                  color: themeListener.isDark
                        ? darkMainTextColor
                        : greyTextColor,),
            )
          ],
        ),
      ),
    );
  }
}
