class GetCurrentUser {
  GetCurrentUser({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final Data data;

  GetCurrentUser.fromJson(Map<String, dynamic> json){
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
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
    this.address,
    required this.role,
    this.UserPoints,
    required this.UserNotification,
  });
  late final String userId;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String imageUrl;
  late final Null address;
  late final String role;
  late final Null UserPoints;
  late final List<dynamic> UserNotification;

  Data.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = null;
    role = json['role'];
    UserPoints = null;
    UserNotification = List.castFrom<dynamic, dynamic>(json['UserNotification']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['imageUrl'] = imageUrl;
    _data['address'] = address;
    _data['role'] = role;
    _data['UserPoints'] = UserPoints;
    _data['UserNotification'] = UserNotification;
    return _data;
  }
}