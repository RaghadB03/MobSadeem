class ProudectsModel {
  String? index;
  String? title;
  String? prize;
  String? dec;
  String? image;
  // String? image3D;
   int? count;
  // bool? isFavorit;

  ProudectsModel({this.index,this.title, this.prize, this.dec, this.count,this.image
  
  });

  ProudectsModel.fromJson(Map<String, dynamic> json) {
    index = json['index']??"";
    title = json['title']??"";
    prize = json['prize']??"";
    dec = json['dec']??"";
    count = json['count'];
     image = json['image'];
  }
}
