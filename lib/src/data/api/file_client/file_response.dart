class ResponseUploadFile {
  String? message;
  Data? data;

  ResponseUploadFile({this.message, this.data});

  ResponseUploadFile.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? fileName;
  String? path;
  int? type;
  int? userId;
  // List<Null>? registrations;
  int? id;
  String? createBy;
  String? updateBy;
  String? updateTime;
  String? createUTC;

  Data(
      {this.fileName,
      this.path,
      this.type,
      this.userId,
      // this.registrations,
      this.id,
      this.createBy,
      this.updateBy,
      this.updateTime,
      this.createUTC});

  Data.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    path = json['path'];
    type = json['type'];
    userId = json['userId'];

    id = json['id'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    createUTC = json['createUTC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileName'] = fileName;
    data['path'] = path;
    data['type'] = type;
    data['userId'] = userId;

    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}
