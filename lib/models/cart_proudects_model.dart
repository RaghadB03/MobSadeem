class CartProudectsModel {
  // String? index;
  String? title;
  String? prize;
  String? dec;
  String? image;
  String? count;
  // String? indexDetailes;
  // List<List<Map<int, String>>>? proudectsDetailes;

  CartProudectsModel(
      {
        // this.index,
      this.title,
      this.prize,
      this.dec,
      this.image,
      count = "1",
      // this.indexDetailes,
      // this.proudectsDetailes
      });

  CartProudectsModel.fromJson(Map<String, dynamic> json) {
    // index = json['index']??"";
    title = json['title']??"";
    prize = json['prize']??"";
    dec = json['dec']??"";
    image = json['image']??"";
    count = json['count']??"";
    // indexDetailes = json["indexDetailes"]??"";
    // proudectsDetailes:
  }
  //  GetUserFriendsModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id']??"";
  //   name = json['name']??"";
  //   bankAccountNumber = json['bankAccountNumber']??"";
  // }
}
