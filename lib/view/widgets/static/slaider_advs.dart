import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../helpers/consts.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> productsSlider = [
      "assets/images/slaider.png",
      "assets/images/product_5.jpg",
      "assets/images/product_6.jpg",
      "assets/images/product_7.jpg",
    ];
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: true,
        height: size.width / 2.4,
        viewportFraction: 0.9,
      ),
      items: productsSlider
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingAllMobile,
                vertical: paddingAllMobile + 5,
              ),
              child: Container(
                // height: size.height*2 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                  color: greyTextColor.withOpacity(0.2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(paddingAllMobile + 10),
                  child: Image.asset(
                    item,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
