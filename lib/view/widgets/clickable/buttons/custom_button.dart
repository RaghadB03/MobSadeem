import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../helpers/consts.dart';
import '../../../../controller/providers/theme_provider.dart';

class MainButtonWidget extends StatefulWidget {
  const MainButtonWidget({
    Key? key,
    required this.isbackround,
    required this.title,
    required this.widthh,
    required this.heightt,
    required this.paddingg,
    required this.color,
  }) : super(key: key);
  final bool isbackround;
  final String title;
  final double widthh;
  final double heightt;
  final double paddingg;
  final Color color;

  @override
  State<MainButtonWidget> createState() => _MainButtonWidgetState();
}

class _MainButtonWidgetState extends State<MainButtonWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return  Container(
        height: widget.heightt,
        width: widget.widthh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(paddingAllMobile + 10),
          color: widget.isbackround ? widget.color : themeListener.isDark?darkBackroundBottomNavigationBarColor: lightBackroundScreenColor,
          border: Border.all(color: widget.color, width: 2),
        ),
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeBodyDesktop
                    : size.width * fontSizeSubTitleMobile,
                fontWeight: FontWeight.bold,
                color: widget.isbackround ? secondeyTextColor : widget.color),
          ),
        ),
      );
  }
}

//button with icon like sign Out
class ButtonWithIconWidget extends StatefulWidget {
  const ButtonWithIconWidget({
    Key? key,
    required this.isbackround,
    required this.title,
    required this.widthh,
    required this.heightt,
    required this.paddingg,
    this.icon = Icons.exit_to_app_rounded,
    required this.ontap,
  }) : super(key: key);
  final bool isbackround;
  final String title;
  final double widthh;
  final double heightt;
  final double paddingg;
  final IconData icon;
  final VoidCallback ontap;

  @override
  State<ButtonWithIconWidget> createState() => _ButtonWithIconWidgetState();
}

//button with Icon
class _ButtonWithIconWidgetState extends State<ButtonWithIconWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        height: widget.heightt,
        width: widget.widthh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(paddingAllMobile + 10),
          color: widget.isbackround ? warningColor : mainTextColor,
          border: Border.all(color: mainColor, width: 2),
        ),
        // ignore: prefer_const_constructors
        child: Padding(
          padding: EdgeInsets.all(widget.paddingg),
          // ignore: prefer_const_constructors
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: widget.isbackround ? mainTextColor : mainColor),
              ),
              const SizedBox(
                width: 15,
              ),
              Icon(widget.icon,
                  color: widget.isbackround ? warningColor.withOpacity(0.8) : mainColor)
            ],
          ),
        ),
      ),
    );
  }
}

class SecondeyButtonWidget extends StatefulWidget {
  const SecondeyButtonWidget({
    Key? key,
    required this.isbackround,
    required this.title,
    required this.widthh,
    required this.heightt,
    required this.paddingg,
    required this.color,
  }) : super(key: key);
  final bool isbackround;
  final String title;
  final double widthh;
  final double heightt;
  final double paddingg;
  final Color color;

  @override
  State<SecondeyButtonWidget> createState() => _SecondeyButtonWidgetState();
}

class _SecondeyButtonWidgetState extends State<SecondeyButtonWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: widget.heightt,
      width: widget.widthh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(paddingAllMobile + 30),
        color: lightBackroundScreenColor,
        border: Border.all(color: mainColor, width: 1.5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingAllMobile - 2,
            ),
            child: CircleAvatar(
              backgroundColor: mainColor.withOpacity(0.8),
              radius: paddingAllTablet + 10,
              child: Icon(
                Icons.arrow_right_alt_rounded,
                size: size.width >= sizeScreen ? size.width / 52 : size.width / 12,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: size.width >= sizeScreen ? size.width / 6 : size.width / 4.2,
          ),
          Center(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeSubTitleDesktop
                    : size.width * fontSizeSubTitleMobile,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
