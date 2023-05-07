class ResponseUserInfo {
  Data? data;
  String? message;

  ResponseUserInfo({this.data, this.message});

  ResponseUserInfo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;

  String? phoneNumber;
  String? avatar;
  String? createDate;

  Data({
    this.id,
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.avatar,
    this.createDate,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];

    phoneNumber = json['phoneNumber'];
    avatar = json['avatar'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;

    data['phoneNumber'] = phoneNumber;
    data['avatar'] = avatar;
    data['createDate'] = createDate;

    return data;
  }
}
