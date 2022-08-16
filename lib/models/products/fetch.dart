class FetchProducts {
  FetchProducts({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final List<dynamic> data;

  FetchProducts.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}