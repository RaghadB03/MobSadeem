import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/consts.dart';
import '../../../controller/providers/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CardproductsHomeWidget extends StatelessWidget {
  final String title;
  final String dec;
  final String prize;
  final String image;
  // final String image3D;
  final bool isHorizontal;
  const CardproductsHomeWidget({
    Key? key,
    required this.title,
    required this.dec,
    required this.prize,
    required this.image,
    // required this.image3D,
    this.isHorizontal = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Padding(
      padding: isHorizontal
          ? const EdgeInsets.symmetric(
              horizontal: paddingAllMobile + 5,
            )
          : const EdgeInsets.symmetric(
              vertical: paddingAllMobile + 5,
            ),
      child: Container(
        width: size.width/2.5,
        decoration: BoxDecoration(
          color: greyTextColor.withOpacity(
            0.1,
          ),
          borderRadius: BorderRadius.circular(
            paddingAllMobile + 5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const SizedBox(
              height: paddingAllMobile,
            ),
            Image.asset(
              image,
              width: double.infinity,
              height: 100,
            ),
            
            const SizedBox(
              height: sizedBoxSameComponentsMobile,
            ),
            Divider(
              color: greyTextColor.withOpacity(
                0.12,
              ),
            ),
            const SizedBox(
              height: sizedBoxSameComponentsMobile,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingAllMobile + 3,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // AppLocalizations.of(context)!.signInTitle,
                    // "Title product",
                    title,
                    style: TextStyle(
                      fontSize: size.width * fontSizeBodyMobile - 2,
                      color: themeListener.isDark
                          ? secondeyTextColor.withOpacity(0.8)
                          : mainTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                ],
              ),
            ),
             const SizedBox(
                   height: sizedBoxSameComponentsMobile+5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:paddingAllMobile + 3 ),
                    child: Row(
                      children: [
                        Text(
                          // AppLocalizations.of(context)!.signInTitle,
                          "$prize ${AppLocalizations.of(context)!.lyd}",
                          style: TextStyle(
                            fontSize: size.width * fontSizeBodyMobile,
                            color: mainColor,
                            // themeListener.isDark
                            //     ? secondeyTextColor.withOpacity(0.8)
                            //     : mainTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
            // const SizedBox(
            //   height: paddingAllMobile,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: paddingAllMobile + 3,
            //   ),
            //   child: Text(
            //     // AppLocalizations.of(context)!.signInTitle,
            //     // "Dec product",
            //     dec,
            //     style: TextStyle(
            //       fontSize: size.width * fontSizeBodyMobile - 2,
            //       color:
            //           themeListener.isDark ? darkMainTextColor : greyTextColor,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // // const SizedBox(
            // //   height: sizedBoxNotSameComponentsMobile,
            // // ),
          ],
        ),
      ),
    );
  }
}