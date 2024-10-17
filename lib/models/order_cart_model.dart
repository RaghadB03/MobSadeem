
class OrderCartModel {
  String? code;
  String? date;
  String? city;
  String? location;
  String? name;
  String? phone;
  bool? isCash;
  String? count;
  String? total;
  int? stateOrder;
  
  // List<ProudectsModel>? cart;

  OrderCartModel(
      {this.code,
      this.date,
      this.city,
      this.location,
      this.name,
      this.phone,
      this.isCash,
      this.count,
      this.total,
      this.stateOrder
      // this.cart
    });

  OrderCartModel.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? "";
    date = json['date'] ?? "";
    city = json['city'] ?? "";
    location = json['location'] ?? "";
    name = json['name'] ?? "";
    phone = json['phone'] ?? "";
    isCash = json['isCash'] ?? false;
    count = json['AllCount'] ?? "";
    total = json['total'] ?? "";
    stateOrder = json['stateOrder'] ?? 0;
    // indexDetailes = json["indexDetailes"]??"";
    // proudectsDetailes:
  }
  //  ProudectsModel.fromJson(Map<String, dynamic> json) {
  //   index = json['index']??"";
  //   title = json['title']??"";
  //   prize = json['prize']??"";
  //   dec = json['dec']??"";
  //   image = json['image']??"";
  //   image3D = json['image3D']??"";
  //   count = json['count']??"";
  //   isFavorit = json['isFavorit']??false;
  //   // indexDetailes = json["indexDetailes"]??"";
  //   // proudectsDetailes:
  // }
}
