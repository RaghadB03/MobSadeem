import 'package:flutter/foundation.dart';
import '../../models/proudects_model.dart';

class CartProvider with ChangeNotifier {
  List<ProudectsModel> cartList = [];
  double totalCart = 0.0;

  addToCart(ProudectsModel cartItem) async {
    cartList.add(ProudectsModel(
      index: cartItem.index,
      title: cartItem.title,
      prize: cartItem.prize,
      dec: cartItem.dec,
      image:"assets/images/png_logo.png",
      count: cartItem.count,
    ));
    notifyListeners();
  }

  removeCartId(
    String indexDetailes,
  ) async {
    cartList.removeWhere((item) => item.index == indexDetailes);
    notifyListeners();
  }

  double totalCost(List<ProudectsModel> cartIt) {
    totalCart = 0.0;
    for (var e in cartIt)
      totalCart += double.parse(e.prize.toString()) * e.count!;
    // notifyListeners();
    return totalCart;
  }
}
