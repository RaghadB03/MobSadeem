import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'view/helpers/consts.dart';
import 'controller/providers/cart_provider.dart';
import 'controller/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'view/pages/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
}                               

  @override
  State<MyApp> createState() => _MyAppState();
}     

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Locale _locale = const Locale('ar');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  getLocalLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? localCode = prefs.getString('langCode');
    if (localCode == 'en') {
      setState(() {
        _locale = const Locale('en');
        setLocale(const Locale('en'));
      });
    } else {
      setState(() {
        _locale = const Locale('ar');
        setLocale(const Locale('ar'));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLocalLang();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkThemeProvider>(
          create: (_) {
            return DarkThemeProvider();
          },
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_) {
            return CartProvider();
          },
        ),
        
      
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeListener, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale(
              'en',
            ),
            Locale(
              'ar',
            ),
          ],
          locale: _locale,
          theme: ThemeData(
            scaffoldBackgroundColor: lightBackroundScreenColor,
            dividerTheme: const DividerThemeData(
              thickness: 1,
              space: sizedBoxSameComponentsMobile,
              color: greyColor,
            ),
            iconTheme: const IconThemeData(
              color: mainTextColor,
              size: iconSizeMobile + 5,
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: _locale == const Locale('en')
                  ? GoogleFonts.balooBhai2()
                  : GoogleFonts.cairo(),
              // surfaceTintColor: lightBackroundScreenColor,
              // backgroundColor: lightBackroundScreenColor,
              iconTheme: const IconThemeData(color: mainTextColor),
            ),
            textTheme: _locale == const Locale('en')
                ? GoogleFonts.balooBhai2TextTheme()
                : GoogleFonts.cairoTextTheme(),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: lightBackroundScreenColor,
            ),
            primaryColor: mainColor,
            scrollbarTheme: ScrollbarThemeData(
              thickness: WidgetStateProperty.all<double>(7),
              // mainAxisMargin:60,
              trackVisibility: WidgetStateProperty.all<bool>(true),
            ).copyWith(
              thumbColor: WidgetStateProperty.all(
                mainColor.withOpacity(0.8),
              ),
              trackColor: WidgetStateProperty.all(
                mainColor.withOpacity(0.8),
              ),
            ),
            navigationBarTheme: const NavigationBarThemeData(
              backgroundColor: lightBackroundScreenColor,
              surfaceTintColor: lightBackroundScreenColor,
            ),
          ),

          home:

      
         
              // TabsScreen()
              const SplashScreen(),
        );
      }),
    );
  }
}










