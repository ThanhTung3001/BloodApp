class ResponseHospitalModel {
  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;
  List<Data>? data;
  bool? succeeded;
  String? errors;
  String? message;

  ResponseHospitalModel(
      {this.pageNumber,
      this.pageSize,
      this.totalPages,
      this.totalRecords,
      this.data,
      this.succeeded,
      this.errors,
      this.message});

  ResponseHospitalModel.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    totalRecords = json['totalRecords'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    succeeded = json['succeeded'];
    errors = json['errors'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['totalPages'] = totalPages;
    data['totalRecords'] = totalRecords;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['succeeded'] = succeeded;
    data['errors'] = errors;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? name;
  String? address;
  String? phoneNumber;
  int? userId;
  // Null? mediaList;
  double? lat;
  double? long;
  // Null? register;
  int? id;
  String? createBy;
  String? updateBy;
  String? updateTime;
  String? createUTC;

  Data(
      {this.name,
      this.address,
      this.phoneNumber,
      this.userId,
      // this.mediaList,
      this.lat,
      this.long,
      // this.register,
      this.id,
      this.createBy,
      this.updateBy,
      this.updateTime,
      this.createUTC});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    userId = json['userId'];
    // mediaList = json['mediaList'];
    lat = json['lat'];
    long = json['long'];
    // register = json['register'];
    id = json['id'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    createUTC = json['createUTC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['userId'] = userId;
    // data['mediaList'] = this.mediaList;
    data['lat'] = lat;
    data['long'] = long;
    // data['register'] = this.register;
    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}
