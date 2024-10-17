import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/consts.dart';
import '../../../controller/providers/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../pages/auth/sign_in_screen.dart';
import '../clickable/buttons/custom_button.dart';

class WaitingDialogWidget extends StatelessWidget {
  const WaitingDialogWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Dialog(
      surfaceTintColor: themeListener.isDark
          ? darkBackroundScreenColor
          : lightBackroundScreenColor,
      backgroundColor: themeListener.isDark
          ? darkBackroundScreenColor
          : lightBackroundScreenColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(paddingAllMobile + 10)),
      child: SizedBox(
        height: size.width / 4,
        child: Padding(
          padding: const EdgeInsets.all(paddingAllTablet),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: size.width * fontSizeSubTitleMobile,
                color: themeListener.isDark
                    ? secondeyTextColor.withOpacity(0.7)
                    : mainTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,

    // required this.image
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Dialog(
      surfaceTintColor: themeListener.isDark
          ? darkBackroundScreenColor
          : lightBackroundScreenColor,
      backgroundColor: themeListener.isDark
          ? darkBackroundScreenColor
          : lightBackroundScreenColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(paddingAllMobile + 10)),
      child: SizedBox(
        height: size.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(paddingAllTablet),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                AppLocalizations.of(context)!.areYousure,
                style: TextStyle(
                  fontSize: size.width * fontSizeSubTitleMobile,
                  color: themeListener.isDark
                      ? secondeyTextColor.withOpacity(0.7)
                      : mainTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        try {
                          await user.delete().then((_){
                             Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                          
                                  (route) => false);

                          });
                        

                          // Handle successful deletion, e.g., navigate to a login screen
                        } on FirebaseAuthException catch (e) {
                          // setState(() {
                          //   isClick = false;
                          // });

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.message.toString())));
                        }
                      }
                    },
                    child: MainButtonWidget(
                      isbackround: false,
                      title: AppLocalizations.of(context)!.yes,
                      widthh: size.width / 3,
                      heightt: size.width / 7,
                      paddingg: 13,
                      color: warningColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: MainButtonWidget(
                      isbackround: false,
                      title: AppLocalizations.of(context)!.no,
                      // \$ ${cartProvider.totalCart}
                      widthh: size.width / 3,
                      heightt: size.width / 7,
                      paddingg: 13,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.btnText,
      required this.onpress,
      required this.image});
  final String title;
  final String subtitle;
  final String btnText;
  final VoidCallback onpress;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Dialog(
      backgroundColor:
          themeListener.isDark ? darkBackroundContinarColor : secondeyTextColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 260,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(children: [
                  const SizedBox(
                    height: sizedBoxSameComponentsMobile,
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: themeListener.isDark
                            ? darktitleColor
                            : mainTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: sizedBoxSameComponentsMobile,
                  ),
                ]),
              ),
            ),
            Positioned(
              top: -60,
              child: CircleAvatar(
                backgroundColor: mainColor,
                radius: 60,
                child: image,
              ),
            )
          ]),
    );
  }
}
