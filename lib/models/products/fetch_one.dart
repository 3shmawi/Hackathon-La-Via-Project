class FetchOne {
  FetchOne({
    required this.type,
    required this.message,
    this.data,
  });
  late final String type;
  late final String message;
  late final Null data;

  FetchOne.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}