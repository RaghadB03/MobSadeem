import 'package:new_app/view/helpers/consts.dart';
import 'package:new_app/view/pages/main/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../../widgets/static/dailod.dart';
import '../../../controller/providers/theme_provider.dart';
import '../../widgets/clickable/drawer/drawer_items.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class TabsScreen extends StatefulWidget {
  int bottomNavIndex;
  TabsScreen({super.key, this.bottomNavIndex = 2});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool x = false;
  final iconList = <IconData>[
    Icons.shopping_cart_outlined,
    Icons.ballot_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    final themeFunctions =
        Provider.of<DarkThemeProvider>(context, listen: false);
      return Scaffold(
        // drawerScrimColor: mainColor,
        drawer: Drawer(
          
          backgroundColor: themeListener.isDark
          ? darkBackroundBottomNavigationBarColor
          : lightBackroundScreenColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingAllMobile + 10,
              ),
              child: Column(
                children: [
                
                  const SizedBox(
                    height: sizedBoxNotSameComponentsMobile,
                  ),
                  Column(
                    children: [
                     
                    
                      DrawerItemWidget(
                          color: themeListener.isDark
                        ? darkMainTextColor
                        : greyTextColor,
                          title: AppLocalizations.of(context)!.draSupport,
                          icon: Icons.settings_outlined,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return WaitingDialogWidget(
                                    title: AppLocalizations.of(context)!
                                        .serviceIsNotAvailable,
                                  );
                                });
                          }),
                      const SizedBox(
                        height: sizedBoxNotSameComponentsMobile,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: sizedBoxNotSameComponentsMobile,
                      ),
                      DrawerItemWidget(
                          color: themeListener.isDark
                        ? darkMainTextColor
                        : greyTextColor,
                          title: AppLocalizations.of(context)!.drawQA,
                          icon: Icons.help_outline_rounded,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return WaitingDialogWidget(
                                    title: AppLocalizations.of(context)!
                                        .serviceIsNotAvailable,
                                  );
                                });
                          }),
                      const SizedBox(
                        height: sizedBoxSameComponentsMobile,
                      ),
                      DrawerItemWidget(
                          color: themeListener.isDark
                        ? darkMainTextColor
                        : greyTextColor,
                          title: AppLocalizations.of(context)!.drawAbout,
                          icon: Icons.error_outline_rounded,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return WaitingDialogWidget(
                                    title: AppLocalizations.of(context)!
                                        .serviceIsNotAvailable,
                                  );
                                });
                          }),
                      const SizedBox(
                        height: sizedBoxNotSameComponentsMobile,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: sizedBoxNotSameComponentsMobile,
                      ),
                      DrawerItemWidget(
                        title: AppLocalizations.of(context)!.draLogOut,
                        icon: Icons.logout,
                        color: warningColor.withOpacity(0.9),
                        onPressed: () async {},
                      ),
                      const SizedBox(
                        height: sizedBoxNotSameComponentsMobile,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: sizedBoxNotSameComponentsMobile,
                      ),
                     
                    ],
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: size.width * fontSizeBodyMobile,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: size.width * 0.030,
                      ),
                      child: const Text(
                        "Raged | 2024",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: themeListener.isDark
            ? darkBackroundBottomNavigationBarColor
            : lightBackroundScreenColor,
        appBar: AppBar(
          leadingWidth: 45,
          backgroundColor: themeListener.isDark
              ? darkBackroundBottomNavigationBarColor
              : lightBackroundScreenColor,
          surfaceTintColor: themeListener.isDark
              ? darkBackroundBottomNavigationBarColor
              : lightBackroundScreenColor,
        ),
        body: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: widget.bottomNavIndex == 0
              ? const CartScreen()
              : widget.bottomNavIndex == 1
                  ? const OrderScreen()
                  : const HomeScreen(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => widget.bottomNavIndex = 2);
          },
          elevation: 4.0,
          backgroundColor: mainColor,
          foregroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            Icons.home_outlined,
            color: secondeyTextColor,
            size: 33,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: widget.bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: paddingAllMobile + 5,
          rightCornerRadius: paddingAllMobile + 5,
          // splashColor:Colors.transparent,
          backgroundColor:
              // Colors.transparent,
              themeListener.isDark
                  ? darkBackroundBottomNavigationBarColor
                  : lightBackroundScreenColor,
          activeColor: mainColor,
          inactiveColor: themeListener.isDark
              ? darksecondeyTextColor
              : darkBackroundContinarColor,
          borderColor: themeListener.isDark
              ? lightBackroundScreenColor.withOpacity(0.08)
              : darkBackroundBottomNavigationBarColor.withOpacity(0.03),
          borderWidth: 4,
          onTap: (index) => setState(
            () => widget.bottomNavIndex = index,
          ),
        ),
      );
   
  }
}
