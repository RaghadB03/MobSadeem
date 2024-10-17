
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/consts.dart';
import '../../widgets/clickable/buttons/custom_button.dart';
import '../../widgets/static/status_dialog_content.dart';
import '../../../models/proudects_model.dart';
import '../../../controller/providers/cart_provider.dart';
import '../../../controller/providers/theme_provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int total = 0;

  Widget continerCartScreen(
    BuildContext context,
    ProudectsModel proudectsDetailes,
    CartProvider cartProvider,
  ) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(paddingAllMobile + 5),
        border: Border.all(
          color: mainColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(paddingAllMobile + 5),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Row(
              children: [
                Image.asset(
                  proudectsDetailes.image.toString(),
                  width: size.width / 5,
                  height: size.width / 5,
                ),
                const SizedBox(
                  width: sizedBoxNotSameComponentsMobile,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      proudectsDetailes.title.toString(),
                      style: TextStyle(
                        fontSize: size.width * fontSizeSubTitleMobile,
                        color: themeListener.isDark
                            ? secondeyTextColor.withOpacity(0.8)
                            : mainTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  //   const SizedBox(
                  //     height: paddingAllMobile,
                  //   ),
                  //   Text(
                  //     proudectsDetailes.dec.toString(),
                  //     style: TextStyle(
                  //       fontSize: size.width * fontSizeBodyMobile,
                  //       color: themeListener.isDark
                  //           ? secondeyTextColor.withOpacity(0.8)
                  //           : mainTextColor.withOpacity(0.8),
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Row(
                //    mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     IconButton(
                //     onPressed: (){
                //       cartProvider.removeCartId(proudectsDetailes.index!, proudectsDetailes.count!);
                //     },
                //     icon: Icon(Icons.delete_outline_rounded,size: 35,color: warningColor,))
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${proudectsDetailes.prize.toString()} ${AppLocalizations.of(context)!.lyd}",
                      style: TextStyle(
                        fontSize: size.width * fontSizeSubTitleMobile,
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: paddingAllMobile,
                    ),
                  ],
                ),
                const SizedBox(
                  height: paddingAllMobile,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${AppLocalizations.of(context)!.quant} :",
                      style: TextStyle(
                        fontSize: size.width * fontSizeBodyMobile,
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: paddingAllMobile,
                    ),
                    Text(
                      proudectsDetailes.count.toString(),
                      style: TextStyle(
                        fontSize: size.width * fontSizeBodyMobile,
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: paddingAllMobile,
                    ),
                  ],
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         cartProvider.addSameItem(proudectsDetailes);
                //         setState(() {

                //         });
                //         // cartProvider.addCount(proudectsDetailes);
                //         // didChangeDependencies();
                //         // cartProvider.count++;
                //         // cartProvider.sameCount++;
                //         // cartProvider.totalCart += double.parse(
                //         //     proudectsDetailes.prize.toString());
                //       },
                //       child: Text(
                //         "+",
                //         style: TextStyle(
                //           fontSize: size.width * fontSizeTitleMobile,
                //           color: greyTextColor,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       width: sizedBoxSameComponentsMobile,
                //     ),
                //     Container(
                //       width: 25,
                //       height: 25,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5),
                //         border: Border.all(
                //           color: mainColor,
                //           width: 2,
                //         ),
                //       ),
                //       child: Center(
                // child: Text(
                //   proudectsDetailes.count.toString(),
                //   // cartProvider.cart[index].count
                //   //     .toString(), // count.toString(),
                //   style: TextStyle(
                //     fontSize: size.width * fontSizeBodyMobile,
                //     color: mainColor,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                //       ),
                //     ),
                //     const SizedBox(
                //       width: sizedBoxSameComponentsMobile,
                //     ),
                //     InkWell(
                //       onTap: () {
                //         // cartProvider.deletCount(proudectsDetailes);
                //       },
                //       child: Text(
                //         "-",
                //         style: TextStyle(
                //           fontSize: size.width * fontSizeTitleMobile,
                //           color: greyTextColor,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Consumer<CartProvider>(builder: (context, cartProvider, _) {
      return cartProvider.cartList.isEmpty
                  ? Center(child: Image.asset("assets/images/png_logo.png"))
                  :
                  
                   Scaffold(
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
                              child: ListView.builder(
                                itemCount: cartProvider.cartList.length,
                                itemBuilder: (context, index) {
                                  // final cartItem = ;

                                  return
                                      //  ChangeNotifierProvider(
                                      //           create: (context) => CartProvider(),
                                      //           child: Consumer<CartProvider>(
                                      //               builder: (context, itemCounterConsumer, _) {
                                      //                 return

                                      Column(
                                    children: [
                                      continerCartScreen(
                                        context,
                                        cartProvider.cartList[index],
                                        cartProvider,
                                      ),
                                      SizedBox(
                                        height: sizedBoxSameComponentsMobile,
                                      ),
                                    ],
                                  );

                                  //                 }
                                  // ));
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      persistentFooterButtons: [
                        ChangeNotifierProvider(
                          create: (context) => CartProvider(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${AppLocalizations.of(context)!.cartPageOSum} :-",
                                    style: TextStyle(
                                      fontSize:
                                          size.width * fontSizeSubTitleMobile,
                                      color: mainColor,
                                      // themeListener.isDark
                                      //     ? secondeyTextColor.withOpacity(0.8)
                                      //     : mainTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // !isget
                                  //     ? GestureDetector(
                                  //         onTap: () {},
                                  //         child: MainButtonWidget(
                                  //           isbackround: false,
                                  //           title:
                                  //               AppLocalizations.of(context)!.cartPageSum,
                                  //           widthh: size.width / 2.5,
                                  //           heightt: size.width / 7.5,
                                  //           paddingg: 13,
                                  //           color: greyTextColor.withOpacity(0.8),
                                  //         ),
                                  //       )
                                  //     :
                                  GestureDetector(
                                    onTap: () {
                                      // if (walletProvider.total >= cartProvider.totalCart) {
                                      // await walletProvider
                                      //     .getCardToWallet(cartProvider.totalCart);
                                      setState(() {});
                                      if (cartProvider.cartList.isNotEmpty) {
                                       
                                      } else {
                                        showCustomFlushbar(
                                          "السلة فارغة",
                                          warningColor,
                                          Icons.error_outline_outlined,
                                          context,
                                        );
                                      }
                                    },
                                    child: MainButtonWidget(
                                        isbackround: false,
                                        title: AppLocalizations.of(context)!
                                            .cartPageSum,
                                        widthh: size.width / 2.5,
                                        heightt: size.width / 7.5,
                                        paddingg: 13,
                                        color: mainColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: sizedBoxSameComponentsMobile,
                              ),
                              // Text(
                              //   "${AppLocalizations.of(context)!.cartPageTItem} : ${cartProvider.cart.length}",
                              //   style: TextStyle(
                              //     fontSize: size.width * fontSizeBodyMobile,
                              //     color:
                              //         // mainColor,
                              //         themeListener.isDark
                              //             ? secondeyTextColor.withOpacity(0.8)
                              //             : mainTextColor,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: paddingAllMobile,
                              // ),
                              Text(
                                AppLocalizations.of(context)!.cartPagePDil,
                                style: TextStyle(
                                  fontSize: size.width * fontSizeBodyMobile,
                                  color:
                                      // mainColor,
                                      themeListener.isDark
                                          ? secondeyTextColor.withOpacity(0.8)
                                          : mainTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              Text(
                                "${AppLocalizations.of(context)!.cartPageTCart} : ${cartProvider.cartList.length}",
                                style: TextStyle(
                                  fontSize: size.width * fontSizeBodyMobile,
                                  color:
                                      // mainColor,
                                      themeListener.isDark
                                          ? secondeyTextColor.withOpacity(0.8)
                                          : mainTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${AppLocalizations.of(context)!.cartPageTCost}: ${cartProvider.totalCost(cartProvider.cartList)} ${AppLocalizations.of(context)!.lyd}",
                                    style: TextStyle(
                                      fontSize: size.width * fontSizeBodyMobile,
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: sizedBoxSameComponentsMobile,
                              ),
                              const SizedBox(
                                height: paddingAllMobile,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
    });
  }
}

