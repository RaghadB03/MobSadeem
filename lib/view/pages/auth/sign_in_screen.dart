import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../helpers/consts.dart';
import '../../../controller/providers/theme_provider.dart';
import '../../widgets/clickable/buttons/custom_button.dart';
import '../../widgets/clickable/buttons/text_button.dart';
import '../../widgets/input/text_form_field.dart';
import '../main/tabs_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //  bool isA= false;
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: themeListener.isDark
            ? darkBackroundBottomNavigationBarColor
            : lightBackroundScreenColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: loginForm,
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(paddingAllMobile + 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.width / 4,
                    ),
                    Text(
                      AppLocalizations.of(context)!.signInTitle,
                      style: TextStyle(
                        fontSize: size.width * fontSizeTitleMobile + 5,
                        color: themeListener.isDark
                            ? secondeyTextColor.withOpacity(0.8)
                            : mainTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: sizedBoxNotSameComponentsMobile,
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!.phoneError;
                        }
                        if (!value.contains('@') || !value.contains('.com')) {
                          return AppLocalizations.of(context)!.email4;
                        }

                        return null;
                      },
                      maxLength: 30,
                      ispassword: false,
                    ),
                    const SizedBox(
                      height: paddingAllMobile,
                    ),
                    Text(
                      AppLocalizations.of(context)!.passwordTextFiled,
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
                      action: TextInputAction.done,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!.phoneError;
                        }
                        if (value.length < 8) {
                          return AppLocalizations.of(context)!.passwordError;
                        }
                        return null;
                      },
                      ispassword: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        persistentFooterButtons: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SizedBox(
                height: sizedBoxSameComponentsMobile,
              ),
              // isA == true
              GestureDetector(
                      onTap: () async {
                        if (loginForm.currentState!.validate()) {
                         
                           Navigator.pushAndRemoveUntil(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                   TabsScreen()),
                                          (route) => false);
                        }
                      },
                      child: MainButtonWidget(
                        isbackround: true,
                        title: AppLocalizations.of(context)!.signIn,
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
                      text: AppLocalizations.of(context)!.butt1,
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      }),
                ],
              ),
              const SizedBox(
                height: paddingAllMobile,
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
