class GetRec {
  GetRec({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final Data data;

  GetRec.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.recieptId,
    required this.userId,
    required this.totalPrice,
    required this.claimedPoints,
    required this.createdAt,
    required this.products,
  });
  late final String recieptId;
  late final String userId;
  late final int totalPrice;
  late final bool claimedPoints;
  late final String createdAt;
  late final List<Products> products;

  Data.fromJson(Map<String, dynamic> json){
    recieptId = json['recieptId'];
    userId = json['userId'];
    totalPrice = json['totalPrice'];
    claimedPoints = json['claimedPoints'];
    createdAt = json['createdAt'];
    products = List.from(json['Products']).map((e)=>Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['recieptId'] = recieptId;
    _data['userId'] = userId;
    _data['totalPrice'] = totalPrice;
    _data['claimedPoints'] = claimedPoints;
    _data['createdAt'] = createdAt;
    _data['Products'] = products.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products({
    required this.recieptId,
    required this.userId,
    required this.quantity,
    required this.productId,
  });
  late final String recieptId;
  late final String userId;
  late final int quantity;
  late final String productId;

  Products.fromJson(Map<String, dynamic> json){
    recieptId = json['recieptId'];
    userId = json['userId'];
    quantity = json['quantity'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['recieptId'] = recieptId;
    _data['userId'] = userId;
    _data['quantity'] = quantity;
    _data['productId'] = productId;
    return _data;
  }
}