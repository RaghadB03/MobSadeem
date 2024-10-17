import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/consts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../controller/providers/theme_provider.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.label,
    this.textAlign = TextAlign.start,
    required this.validator,
    required this.hintText,
    this.suffixText = "+218",
    this.obSecureText = false,
    this.readOnlyy = false,
    this.initialVal = false,
    this.perfix,
    required this.ispassword,
    this.maxLine = 1,
    required this.keyboardType,
    this.maxLength = 16,
    this.action = TextInputAction.next,
  });
  final TextEditingController controller;
  final String? label;
  final int maxLength;
  final String hintText;
  final FormFieldValidator<String?> validator;
  final bool ispassword;
  final TextInputType keyboardType;
  final int maxLine;
  final bool obSecureText;
  final bool readOnlyy;
  final bool initialVal;
  final Widget? perfix;
  final TextAlign? textAlign;
  final String suffixText;
  final TextInputAction action;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool ispasswordshow = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return widget.initialVal
        ? TextFormField(
            //  textDirection: TextDirection.ltr,

            maxLength: widget.maxLength,
            maxLines: widget.maxLine,
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            textInputAction: widget.action,
            obscureText:
                widget.ispassword ? ispasswordshow : widget.obSecureText,
            keyboardType: widget.keyboardType,
            readOnly: widget.readOnlyy,
            style: TextStyle(
              fontSize: size.width >= sizeScreen
                  ? size.width * fontSizeBodyDesktop
                  : size.width * fontSizeBodyMobile,
              color:themeListener.isDark
                                    ? secondeyTextColor.withOpacity(0.8)
                                    : mainTextColor,
              //  themeListener.isDark
              //     ? darkMainTextColor
              //     : greyTextColor.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              helperStyle: TextStyle(
                color: themeListener.isDark
                    ? darkMainTextColor
                    : greyTextColor.withOpacity(0.8),
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeBodyDesktop - 3
                    : size.width * fontSizeBodyMobile - 3,
              ),
              errorMaxLines: 1,
              // floatingLabelBehavior:FloatingLabelBehavior.always,
              floatingLabelStyle: TextStyle(
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeBodyDesktop - 3
                    : size.width * fontSizeBodyMobile,
                color: mainColor,
                // fontWeight: FontWeight.bold,
              ),
              errorStyle: TextStyle(
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeBodyDesktop - 3
                    : size.width * fontSizeBodyMobile - 2,
                color: warningColor.withOpacity(0.8),
              ),
              // labelText: widget.label ?? "",
              // labelStyle: TextStyle(
              //   fontSize: size.width * fontSizeBodyMobile,
              //   color: greyTextColor.withOpacity(0.8),
              //   fontWeight: FontWeight.bold,
              // ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: paddingAllMobile + 5,
                    vertical: paddingAllMobile + 10),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    AppLocalizations.of(context)!.localeName == 'en'
                        ? "| ${widget.suffixText}"
                        : "${widget.suffixText} |",
                    style: TextStyle(
                      fontSize: size.width >= sizeScreen
                          ? size.width * fontSizeBodyDesktop
                          : size.width * fontSizeBodyMobile,
                      color: themeListener.isDark
                          ? darkMainTextColor
                          : greyTextColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16),
              prefixIcon: widget.perfix,
              fillColor: themeListener.isDark
                  ? greyTextColor.withOpacity(0.1)
                  : greyTextColor.withOpacity(0.06),
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: themeListener.isDark
                    ? darkMainTextColor
                    : greyTextColor.withOpacity(0.8),
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeBodyDesktop
                    : size.width * fontSizeBodyMobile,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                  borderSide: BorderSide(
                    color: greyTextColor.withOpacity(0.1),
                  )),
              focusColor: mainColor,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: BorderSide(
                  color: greyTextColor.withOpacity(0.1),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: BorderSide(
                  color: greyTextColor.withOpacity(0.1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: BorderSide(color: warningColor.withOpacity(0.8)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: BorderSide(color: warningColor.withOpacity(0.8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: const BorderSide(
                  color: mainColor,
                ),
              ),
            ),
          )
        : TextFormField(
            maxLength: widget.maxLength,
            maxLines: widget.maxLine,
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            textInputAction: widget.action,
            obscureText:
                widget.ispassword ? ispasswordshow : widget.obSecureText,
            keyboardType: widget.keyboardType,
            readOnly: widget.readOnlyy,
            style: TextStyle(
              fontSize: size.width >= sizeScreen
                  ? size.width * fontSizeBodyDesktop
                  : size.width * fontSizeBodyMobile,
              color: themeListener.isDark
                                    ? secondeyTextColor.withOpacity(0.8)
                                    : mainTextColor,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              helperStyle: TextStyle(
                color: themeListener.isDark
                    ? darkMainTextColor
                    : greyTextColor.withOpacity(0.8),
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeBodyDesktop - 3
                    : size.width * fontSizeBodyMobile - 3,
              ),
              errorMaxLines: 1,
              // floatingLabelBehavior:FloatingLabelBehavior.always,
              floatingLabelStyle: TextStyle(
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeBodyDesktop - 3
                    : size.width * fontSizeBodyMobile,
                color: mainColor,
                // fontWeight: FontWeight.bold,
              ),
              errorStyle: TextStyle(
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeBodyDesktop - 3
                    : size.width * fontSizeBodyMobile - 2,
                color: warningColor.withOpacity(0.8),
              ),
              // labelText: widget.label ?? "",
              // labelStyle: TextStyle(
              //   fontSize: size.width * fontSizeBodyMobile,
              //   color: greyTextColor.withOpacity(0.8),
              //   fontWeight: FontWeight.bold,
              // ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16),
              suffixIcon: widget.ispassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          ispasswordshow = !ispasswordshow;
                        });
                      },
                      icon: Icon(
                        ispasswordshow
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: mainColor,
                        size: iconSizeTablet - 2,
                      ),
                    )
                  : widget.perfix,
              fillColor: themeListener.isDark
                  ? greyTextColor.withOpacity(0.1)
                  : greyTextColor.withOpacity(0.06),
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: themeListener.isDark
                    ? darkMainTextColor
                    : greyTextColor.withOpacity(0.8),
                fontSize: size.width >= sizeScreen
                    ? size.width * fontSizeBodyDesktop
                    : size.width * fontSizeBodyMobile,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                  borderSide: BorderSide(
                    color: greyTextColor.withOpacity(0.1),
                  )),
              focusColor: mainColor,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: BorderSide(
                  color: greyTextColor.withOpacity(0.1),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: BorderSide(
                  color: greyTextColor.withOpacity(0.1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: BorderSide(color: warningColor.withOpacity(0.8)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: BorderSide(color: warningColor.withOpacity(0.8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                borderSide: const BorderSide(
                  color: mainColor,
                ),
              ),
            ),
          );
  }
}
