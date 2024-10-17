class StateOrderModel {
  String? codeOrder;
  String? stateOrder;

  StateOrderModel({
    this.codeOrder,
    this.stateOrder,  
  });

  StateOrderModel.fromJson(Map<String, dynamic> json) {
    codeOrder = json['codeOrder'] ?? "";
    stateOrder = json['stateOrder'] ?? "";
  }
}
