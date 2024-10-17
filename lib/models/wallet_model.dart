class WalletModel {
  String? index;
  String? number;
  String? prize;
  String? date;
  String? time;

  WalletModel({this.index,this.number, this.prize, this.date, this.time,});

  WalletModel.fromJson(Map<String, dynamic> json) {
    index = json['index']??"";
    number = json['number']??"";
    prize = json['prize']??"";
    date = json['date']??"";
    time = json['time']??"";
  }
}