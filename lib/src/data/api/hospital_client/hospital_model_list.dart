class ResponseHospitalList {
  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;
  List<Data>? data;
  bool? succeeded;
  String? errors;
  String? message;

  ResponseHospitalList(
      {this.pageNumber,
      this.pageSize,
      this.totalPages,
      this.totalRecords,
      this.data,
      this.succeeded,
      this.errors,
      this.message});

  ResponseHospitalList.fromJson(Map<String, dynamic> json) {
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
  // void? mediaList;
  double? lat;
  double? long;
  // void? register;
  // void? userInfos;
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
      // this.userInfos,
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
    // userInfos = json['userInfos'];
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
    // data['mediaList'] = mediaList;
    data['lat'] = lat;
    data['long'] = long;
    // data['register'] = register;
    // data['userInfos'] = userInfos;
    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}
