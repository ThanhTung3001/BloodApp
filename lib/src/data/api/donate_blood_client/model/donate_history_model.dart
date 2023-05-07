class DonateHistoryModel {
  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;
  List<ResponseDetailRegistration>? data;
  bool? succeeded;
  String? errors;
  String? message;

  DonateHistoryModel(
      {this.pageNumber,
      this.pageSize,
      this.totalPages,
      this.totalRecords,
      this.data,
      this.succeeded,
      this.errors,
      this.message});

  DonateHistoryModel.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    totalRecords = json['totalRecords'];
    if (json['data'] != null) {
      data = <ResponseDetailRegistration>[];
      json['data'].forEach((v) {
        data!.add(ResponseDetailRegistration.fromJson(v));
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

class ResponseDetailRegistration {
  int? id;
  int? bloodGroupId;
  BloodGroup? bloodGroup;
  int? capacity;
  String? registerTime;
  int? hospitalId;
  Hospital? hospital;
  int? userId;
  UserInfo? userInfo;
  int? status;
  String? qrCode;

  ResponseDetailRegistration(
      {this.id,
      this.bloodGroupId,
      this.bloodGroup,
      this.capacity,
      this.registerTime,
      this.hospitalId,
      this.hospital,
      this.userId,
      this.userInfo,
      this.status,
      this.qrCode});

  ResponseDetailRegistration.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bloodGroupId = json['bloodGroupId'];
    bloodGroup = json['bloodGroup'] != null
        ? BloodGroup.fromJson(json['bloodGroup'])
        : null;
    capacity = json['capacity'];
    registerTime = json['registerTime'];
    hospitalId = json['hospitalId'];
    hospital =
        json['hospital'] != null ? Hospital.fromJson(json['hospital']) : null;
    userId = json['userId'];
    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    status = json['status'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bloodGroupId'] = bloodGroupId;
    if (bloodGroup != null) {
      data['bloodGroup'] = bloodGroup!.toJson();
    }
    data['capacity'] = capacity;
    data['registerTime'] = registerTime;
    data['hospitalId'] = hospitalId;
    if (hospital != null) {
      data['hospital'] = hospital!.toJson();
    }
    data['userId'] = userId;
    if (userInfo != null) {
      data['userInfo'] = userInfo!.toJson();
    }
    data['status'] = status;
    data['qrCode'] = qrCode;
    return data;
  }
}

class BloodGroup {
  String? name;
  String? description;
  bool? urgent;
  int? capacity;
  String? avatar;

  BloodGroup(
      {this.name, this.description, this.urgent, this.capacity, this.avatar});

  BloodGroup.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    urgent = json['urgent'];
    capacity = json['capacity'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['urgent'] = urgent;
    data['capacity'] = capacity;
    data['avatar'] = avatar;
    return data;
  }
}

class Hospital {
  String? name;
  String? address;
  String? phoneNumber;
  int? userId;
  double? lat;
  double? long;

  Hospital(
      {this.name,
      this.address,
      this.phoneNumber,
      this.userId,
      this.lat,
      this.long});

  Hospital.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    userId = json['userId'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['userId'] = userId;
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}

class UserInfo {
  int? appUserId;
  String? fullName;
  int? age;
  String? avatar;
  String? phoneNumber;
  int? donateAmount;
  int? star;
  int? totalDonate;
  String? birthDate;
  int? iccid;
  String? address;
  String? bloodId;
  String? note;
  int? weight;

  UserInfo(
      {this.appUserId,
      this.fullName,
      this.age,
      this.avatar,
      this.phoneNumber,
      this.donateAmount,
      this.star,
      this.totalDonate,
      this.birthDate,
      this.iccid,
      this.address,
      this.bloodId,
      this.note,
      this.weight});

  UserInfo.fromJson(Map<String, dynamic> json) {
    appUserId = json['appUserId'];
    fullName = json['fullName'];
    age = json['age'];
    avatar = json['avatar'];
    phoneNumber = json['phoneNumber'];
    donateAmount = json['donateAmount'];
    star = json['star'];
    totalDonate = json['totalDonate'];
    birthDate = json['birthDate'];
    iccid = json['iccid'];
    address = json['address'];
    bloodId = json['bloodId'];
    note = json['note'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appUserId'] = appUserId;
    data['fullName'] = fullName;
    data['age'] = age;
    data['avatar'] = avatar;
    data['phoneNumber'] = phoneNumber;
    data['donateAmount'] = donateAmount;
    data['star'] = star;
    data['totalDonate'] = totalDonate;
    data['birthDate'] = birthDate;
    data['iccid'] = iccid;
    data['address'] = address;
    data['bloodId'] = bloodId;
    data['note'] = note;
    data['weight'] = weight;
    return data;
  }
}
