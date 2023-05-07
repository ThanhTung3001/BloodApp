class ResponseAuth {
  bool? succeeded;
  String? errors;
  String? message;
  Data? data;

  ResponseAuth({this.succeeded, this.errors, this.message, this.data});

  ResponseAuth.fromJson(Map<String, dynamic> json) {
    succeeded = json['succeeded'];
    errors = json['errors'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['succeeded'] = succeeded;
    data['errors'] = errors;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userName;
  String? email;
  List<String>? roles;
  bool? isVerified;
  String? jwToken;
  String? refreshToken;

  Data(
      {this.id,
      this.userName,
      this.email,
      this.roles,
      this.isVerified,
      this.jwToken,
      this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    isVerified = json['isVerified'];
    jwToken = json['jwToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['email'] = email;
    data['roles'] = roles;
    data['isVerified'] = isVerified;
    data['jwToken'] = jwToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
