import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/consts.dart';
import '../../../models/order_cart_model.dart';
import '../../../controller/providers/theme_provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<OrderCartModel> orderList = [];
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: themeListener.isDark
          ? darkBackroundBottomNavigationBarColor
          : lightBackroundScreenColor,
      body: SafeArea(
        child: RefreshIndicator(
          color: mainColor,
          backgroundColor: themeListener.isDark
              ? darkBackroundBottomNavigationBarColor
              : lightBackroundScreenColor,
          onRefresh: () async {},
          child: Padding(
              padding: const EdgeInsets.all(paddingAllMobile + 5),
              child: Center(
                child: Icon(
                  Icons.ballot_outlined,
                  size: 80,
                  color: mainColor,
                ),
              )),
        ),
      ),
    );
  }
}
