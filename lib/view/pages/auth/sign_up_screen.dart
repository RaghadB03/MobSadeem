import 'package:new_app/view/pages/auth/sign_in_screen.dart';
import 'package:new_app/view/pages/main/tabs_screen.dart';
import 'package:new_app/view/widgets/clickable/buttons/text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../helpers/consts.dart';
import '../../../controller/providers/theme_provider.dart';
import '../../widgets/clickable/buttons/custom_button.dart';
import '../../widgets/input/text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  final bool isBack;
  const SignUpScreen({
    Key? key,
    this.isBack = true,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController listNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController coinPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
   

    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return  Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: themeListener.isDark
                  ? darkBackroundBottomNavigationBarColor
                  : lightBackroundScreenColor,
                  appBar: AppBar(),
              body: SafeArea(
                child: Form(
                  key: signUpForm,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: sizedBoxNotSameComponentsMobile +
                              sizedBoxNotSameComponentsMobile,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingAllMobile + 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.signup1,
                                style: TextStyle(
                                  fontSize:
                                      size.width * fontSizeTitleMobile + 5,
                                  color: themeListener.isDark
                                      ? secondeyTextColor.withOpacity(0.8)
                                      : mainTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: sizedBoxSameComponentsMobile,
                              ),
                              // Text(
                              //   AppLocalizations.of(context)!.signUpSubTitle,
                              //   style: TextStyle(
                              //     fontSize: size.width * fontSizeBodyMobile,
                              //     color: themeListener.isDark
                              //         ? darkMainTextColor
                              //         : greyTextColor,
                              //   ),
                              // ),
                              const SizedBox(
                                height: sizedBoxNotSameComponentsMobile,
                              ),
                              Text(
                                AppLocalizations.of(context)!.name2,
                                style: TextStyle(
                                  fontSize: size.width * fontSizeBodyMobile,
                                  color: themeListener.isDark
                                      ? darkMainTextColor
                                      : greyTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              TextFieldWidget(
                                initialVal: false,
                                label: "",
                                controller: firstNameController,
                                keyboardType: TextInputType.name,
                                hintText: "",
                                action: TextInputAction.next,
                                maxLength: 30,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .phoneError;
                                  }

                                  return null;
                                },
                                ispassword: false,
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              Text(
                                AppLocalizations.of(context)!.name5,
                                style: TextStyle(
                                  fontSize: size.width * fontSizeBodyMobile,
                                  color: themeListener.isDark
                                      ? darkMainTextColor
                                      : greyTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              TextFieldWidget(
                                initialVal: false,
                                label: "",
                                controller: listNameController,
                                keyboardType: TextInputType.name,
                                hintText: "",
                                action: TextInputAction.next,
                                maxLength: 30,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .phoneError;
                                  }

                                  return null;
                                },
                                ispassword: false,
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              Text(
                                AppLocalizations.of(context)!.email2,
                                style: TextStyle(
                                  fontSize: size.width * fontSizeBodyMobile,
                                  color: themeListener.isDark
                                      ? darkMainTextColor
                                      : greyTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              TextFieldWidget(
                                initialVal: false,
                                label: "",
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: "",
                                action: TextInputAction.next,
                                maxLength: 30,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .phoneError;
                                  }
                                  if (!value.contains('@') ||
                                      !value.contains('.com')) {
                                    return AppLocalizations.of(context)!.email4;
                                  }

                                  // if ((value.startsWith('9', 0)) &&
                                  //     (value.startsWith('1', 1) ||
                                  //         value.startsWith('2', 1) ||
                                  //         value.startsWith('4', 1) ||
                                  //         value.startsWith('5', 1)) &&
                                  //     (value.length == 9) &&
                                  //     (!value.contains('.')) &&
                                  //     (!value.contains('-'))) {
                                  // } else {
                                  //   return AppLocalizations.of(context)!
                                  //       .phoneError;
                                  // }

                                  return null;
                                },
                                ispassword: false,
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              Text(
                                AppLocalizations.of(context)!.passwordTitle,
                                style: TextStyle(
                                  fontSize: size.width * fontSizeBodyMobile,
                                  color: themeListener.isDark
                                      ? darkMainTextColor
                                      : greyTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              TextFieldWidget(
                                label: "",
                                hintText: "",
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                action: TextInputAction.next,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .phoneError;
                                  }
                                  if (value.length < 8) {
                                    return AppLocalizations.of(context)!
                                        .passwordError;
                                  }
                                  return null;
                                },
                                ispassword: true,
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              Text(
                                "${AppLocalizations.of(context)!.confim} ${AppLocalizations.of(context)!.passwordTextFiled}",
                                style: TextStyle(
                                  fontSize: size.width * fontSizeBodyMobile,
                                  color: themeListener.isDark
                                      ? darkMainTextColor
                                      : greyTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              TextFieldWidget(
                                label: "",
                                hintText: "",
                                controller: coinPasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                action: TextInputAction.done,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .phoneError;
                                  }
                                  if (value.length < 8) {
                                    return AppLocalizations.of(context)!
                                        .passwordError;
                                  }
                                  return null;
                                },
                                ispassword: true,
                              ),
                              const SizedBox(
                                height: sizedBoxNotSameComponentsMobile,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              persistentFooterButtons: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                         GestureDetector(
                            onTap: () async {
                              if (signUpForm.currentState!.validate()) {
                            
                                if (passwordController.text ==
                                    coinPasswordController.text) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                   TabsScreen()),
                                          (route) => false);
                                  
                                      // fireStorgeConsumer.isF();
                                    
                                    }
                              }

                           
                            
                            },
                            child: MainButtonWidget(
                              isbackround: true,
                              title: AppLocalizations.of(context)!.signUp,
                              widthh: double.infinity,
                              heightt: size.width / 6.5,
                              paddingg: 13,
                              color: mainColor,
                            ),
                          ),
                    const SizedBox(
                      height: paddingAllMobile,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButtonWidget(
                            text: AppLocalizations.of(context)!.butt2,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const SignInScreen()),
                              );
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: sizedBoxNotSameComponentsMobile,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ),
                  ],
                ),
              ],
            );
    
  }
}
