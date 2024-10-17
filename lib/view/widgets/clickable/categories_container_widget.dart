import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/consts.dart';
import '../../../controller/providers/theme_provider.dart';

// ignore: must_be_immutable
class CategoriesContainerWidget extends StatelessWidget {
  String title;
  String image;
  CategoriesContainerWidget({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingAllMobile + 5,
      ),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(
              paddingAllMobile + 3,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                paddingAllMobile + 5,
              ),
              color: greyTextColor.withOpacity(0.12),
            ),
            child: Image.asset(
              image,
              color: secondColor,
            ),
          ),
          const SizedBox(
            height: paddingAllMobile,
          ),
          Text(
            // AppLocalizations.of(context)!.signInTitle,
            title,
            style: TextStyle(
              fontSize: size.width * fontSizeBodyMobile,
              color: themeListener.isDark ? darkMainTextColor : greyTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
