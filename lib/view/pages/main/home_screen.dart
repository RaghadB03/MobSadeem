import 'package:flutter/material.dart';
import 'package:new_app/controller/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:new_app/view/helpers/consts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/clickable/buttons/custom_button.dart';
import '../../../models/proudects_model.dart';
import '../../../controller/providers/theme_provider.dart';
import '../../widgets/clickable/cardproducts_home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  List<ProudectsModel> filteredData = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    filteredData = productsOne;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        setState(() {
          filteredData = productsOne
              .where((data) => data.title!
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
              .toList();
        });
      } else {
        setState(() {
          filteredData = productsOne;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          padding: const EdgeInsets.all(
            paddingAllMobile + 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: sizedBoxNotSameComponentsMobile,
              // ),
              const SizedBox(
                height: paddingAllMobile,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: paddingAllMobile + 5),
                child: Text(
                  // AppLocalizations.of(context)!.signInTitle,
                  "${AppLocalizations.of(context)!.draHi}",
                  style: TextStyle(
                    fontSize: size.width * fontSizeSubTitleMobile,
                    color: themeListener.isDark
                        ? secondeyTextColor.withOpacity(0.8)
                        : mainTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: paddingAllMobile,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: paddingAllMobile + 5),
                child: Text(
                  // AppLocalizations.of(context)!.signInTitle,
                  AppLocalizations.of(context)!.enjoy,
                  style: TextStyle(
                    fontSize: size.width * fontSizeBodyMobile,
                    color: themeListener.isDark
                        ? darkMainTextColor
                        : greyTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: sizedBoxNotSameComponentsMobile,
              ),
              TextFormField(
                controller: searchController,
                keyboardType: TextInputType.multiline,
                autofocus: false,
                style: TextStyle(
                  fontSize: size.width >= sizeScreen
                      ? size.width * fontSizeBodyDesktop
                      : size.width * fontSizeBodyMobile,
                  color: greyTextColor,
                ),
                onChanged: (query) {
                  searchController.text = query;
                },
                decoration: InputDecoration(
                  fillColor: themeListener.isDark
                      ? greyTextColor.withOpacity(0.1)
                      : greyTextColor.withOpacity(0.06),
                  filled: true,
                  floatingLabelStyle: TextStyle(
                    fontSize: size.width >= sizeScreen
                        ? size.width * fontSizeBodyDesktop
                        : size.width * fontSizeBodyMobile,
                    color: mainColor,
                    // fontWeight: FontWeight.bold,
                  ),
                  helperStyle: TextStyle(
                    color: greyTextColor,
                    fontSize: size.width >= sizeScreen
                        ? size.width * fontSizeBodyDesktop
                        : size.width * fontSizeBodyMobile - 3,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 16),
                  hintStyle: TextStyle(
                    color: greyTextColor,
                    fontSize: size.width >= sizeScreen
                        ? size.width * fontSizeBodyDesktop
                        : size.width * fontSizeBodyMobile,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: greyTextColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(paddingAllMobile + 20),
                    borderSide: BorderSide(
                      color: greyTextColor.withOpacity(0.1),
                    ),
                  ),
                  focusColor: mainColor,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(paddingAllMobile + 20),
                    borderSide: BorderSide(
                      color: greyTextColor.withOpacity(0.1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(paddingAllMobile + 20),
                    borderSide: BorderSide(
                      color: greyTextColor.withOpacity(0.1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(paddingAllMobile + 20),
                    borderSide: const BorderSide(
                      color: mainColor,
                    ),
                  ),
                  hintText: AppLocalizations.of(context)!.search,
                ),
              ),
              const SizedBox(
                height: sizedBoxNotSameComponentsMobile + 10,
              ),

              Expanded(
                child: filteredData.isEmpty
                    ? Center(
                        child: Image.asset("assets/images/Empty-rafiki.png"))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 1.5,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 20,
                          crossAxisCount: 2,
                        ),
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return ShowBottomSheet(
                                  index: filteredData[index].index.toString(),
                                  title: filteredData[index].title.toString(),
                                  prize: filteredData[index].prize.toString(),
                                  dec: filteredData[index].dec.toString(),
                                  image: filteredData[index].image.toString(),
                                );
                              },
                            );
                          },
                          child: CardproductsHomeWidget(
                            title: filteredData[index].title.toString(),
                            prize: filteredData[index].prize.toString(),
                            dec: filteredData[index].dec.toString(),
                            image: filteredData[index].image.toString(),
                            isHorizontal: false,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class ShowBottomSheet extends StatefulWidget {
  final String index;
  final String title;
  final String dec;
  final String prize;
  final String image;
  const ShowBottomSheet(
      {super.key,
      required this.index,
      required this.title,
      required this.dec,
      required this.prize,
      required this.image});

  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  int count = 1;
  bool isClick1 = false;
  bool isClick2 = false;
  bool isClick3 = false;
  bool isClick4 = false;
  bool isClick5 = false;
  bool isClick6 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
    return Container(
      color: themeListener.isDark
          ? darkBackroundBottomNavigationBarColor
          : lightBackroundScreenColor,
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            // 'اختر طاولة',
            // "Select table"
             AppLocalizations.of(context)!.sel1,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: themeListener.isDark
                        ? darkMainTextColor
                        : greyTextColor,),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isClick1 = !isClick1;
                    isClick6 = false;
                    isClick2 = false;
                    isClick3 = false;
                    isClick4 = false;
                    isClick5 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5),
                      border: Border.all(
                          color: isClick1 ? mainColor : Colors.transparent)),
                  child: Icon(
                    Icons.table_bar,
                    size: 120,
                    color: mainColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isClick2 = !isClick2;
                    isClick6 = false;
                    isClick1 = false;
                    isClick3 = false;
                    isClick4 = false;
                    isClick5 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5),
                      border: Border.all(
                          color: isClick2 ? mainColor : Colors.transparent)),
                  child: Icon(
                    Icons.table_bar,
                    size: 120,
                    color: mainColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isClick3 = !isClick3;
                    isClick6 = false;
                    isClick2 = false;
                    isClick1 = false;
                    isClick4 = false;
                    isClick5 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5),
                      border: Border.all(
                          color: isClick3 ? mainColor : Colors.transparent)),
                  child: Icon(
                    Icons.table_bar,
                    size: 120,
                    color: mainColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isClick4 = !isClick4;
                    isClick6 = false;
                    isClick2 = false;
                    isClick1 = false;
                    isClick3 = false;
                    isClick5 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5),
                      border: Border.all(
                          color: isClick4 ? mainColor : Colors.transparent)),
                  child: Icon(
                    Icons.table_bar,
                    size: 120,
                    color: mainColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isClick5 = !isClick5;
                    isClick6 = false;
                    isClick2 = false;
                    isClick3 = false;
                    isClick4 = false;
                    isClick1 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5),
                      border: Border.all(
                          color: isClick5 ? mainColor : Colors.transparent)),
                  child: Icon(
                    Icons.table_bar,
                    size: 120,
                    color: mainColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isClick6 = !isClick6;
                    isClick1 = false;
                    isClick2 = false;
                    isClick3 = false;
                    isClick4 = false;
                    isClick5 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5),
                      border: Border.all(
                          color: isClick6 ? mainColor : Colors.transparent)),
                  child: Icon(
                    Icons.table_bar,
                    size: 120,
                    color: mainColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Text(
            // 'حدد العدد',
            AppLocalizations.of(context)!.sel2,
            // Select count
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: themeListener.isDark
                        ? darkMainTextColor
                        : greyTextColor,),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    count += 1;
                  });
                },
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 20,
                    color: greyTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: sizedBoxSameComponentsMobile,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: mainColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    // widget.proudectsDetailes.count
                    count.toString(),
                    // cartProvider.cart[index].count
                    //     .toString(), // count.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: sizedBoxSameComponentsMobile,
              ),
              InkWell(
                onTap: () {
                  if (count > 1) {
                    setState(() {
                      count -= 1;
                    });
                  }

                  // cartProvider.deletCount(proudectsDetailes);
                },
                child: Text(
                  "-",
                  style: TextStyle(
                    fontSize: 20,
                    color: greyTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () async {
              if (isClick1 ||
                  isClick2 ||
                  isClick3 ||
                  isClick4 ||
                  isClick5 ||
                  isClick6) {
                cartProvider.addToCart(ProudectsModel(
                    index: widget.index,
                    title: widget.title,
                    prize: widget.prize,
                    dec: widget.dec,
                    count: count,
                    image: "assets/images/png_logo.png"));
                Navigator.pop(context);
              }
            },
            child: MainButtonWidget(
              isbackround: true,
              title: AppLocalizations.of(context)!.add,
              widthh: double.infinity,
              heightt: size.width / 6.5,
              paddingg: 13,
              color: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}

List<ProudectsModel> productsOne = [
  ProudectsModel(
    index: "1",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "2",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "3",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "4",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "5",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "6",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "7",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "8",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "9",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "10",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "11",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
  ProudectsModel(
    index: "12",
    title: "Sadeem",
    prize: "300",
    image: "assets/images/png_logo.png",
  ),
];
