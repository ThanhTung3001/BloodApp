class ResponseEvent {
  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;
  List<Data>? data = [];
  bool? succeeded;
  String? errors;
  String? message;

  ResponseEvent(
      {this.pageNumber,
      this.pageSize,
      this.totalPages,
      this.totalRecords,
      this.data,
      this.succeeded,
      this.errors,
      this.message});

  ResponseEvent.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? description;
  String? avatar;
  String? startTime;
  String? finishTime;
  List<EventUserSubs>? eventUserSubs;
  int? id;
  String? createBy;
  String? updateBy;
  String? updateTime;
  String? createUTC;

  Data(
      {this.title,
      this.description,
      this.avatar,
      this.startTime,
      this.finishTime,
      this.eventUserSubs,
      this.id,
      this.createBy,
      this.updateBy,
      this.updateTime,
      this.createUTC});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    avatar = json['avatar'];
    startTime = json['startTime'];
    finishTime = json['finishTime'];
    if (json['eventUserSubs'] != null) {
      eventUserSubs = <EventUserSubs>[];
      json['eventUserSubs'].forEach((v) {
        eventUserSubs!.add(EventUserSubs.fromJson(v));
      });
    }
    id = json['id'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    createUTC = json['createUTC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['avatar'] = avatar;
    data['startTime'] = startTime;
    data['finishTime'] = finishTime;
    if (eventUserSubs != null) {
      data['eventUserSubs'] = eventUserSubs!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}

class EventUserSubs {
  int? userInfoId;
  UserInfo? userInfo;
  int? eventId;

  EventUserSubs({this.userInfoId, this.userInfo, this.eventId});

  EventUserSubs.fromJson(Map<String, dynamic> json) {
    userInfoId = json['userInfoId'];
    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    eventId = json['eventId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userInfoId'] = userInfoId;
    if (userInfo != null) {
      data['userInfo'] = userInfo!.toJson();
    }
    data['eventId'] = eventId;
    return data;
  }
}

class UserInfo {
  int? appUserId;
  String? email;
  String? fullName;
  int? age;
  String? avatar;
  String? phoneNumber;
  int? donateAmount;
  int? star;
  int? totalDonate;
  String? birthDate;
  int? iccid;
  // List<void>? register;
  String? bloodId;
  String? bloodGroup;
  // List<void>? eventUserSubs;
  int? id;
  String? createBy;
  String? updateBy;
  String? updateTime;
  String? createUTC;

  UserInfo(
      {this.appUserId,
      this.email,
      this.fullName,
      this.age,
      this.avatar,
      this.phoneNumber,
      this.donateAmount,
      this.star,
      this.totalDonate,
      this.birthDate,
      this.iccid,
      // this.register,
      this.bloodId,
      this.bloodGroup,
      // this.eventUserSubs,
      this.id,
      this.createBy,
      this.updateBy,
      this.updateTime,
      this.createUTC});

  UserInfo.fromJson(Map<String, dynamic> json) {
    appUserId = json['appUserId'];
    email = json['email'];
    fullName = json['fullName'];
    age = json['age'];
    avatar = json['avatar'];
    phoneNumber = json['phoneNumber'];
    donateAmount = json['donateAmount'];
    star = json['star'];
    totalDonate = json['totalDonate'];
    birthDate = json['birthDate'];
    iccid = json['iccid'];

    bloodId = json['bloodId'];
    bloodGroup = json['bloodGroup'];

    id = json['id'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    createUTC = json['createUTC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appUserId'] = appUserId;
    data['email'] = email;
    data['fullName'] = fullName;
    data['age'] = age;
    data['avatar'] = avatar;
    data['phoneNumber'] = phoneNumber;
    data['donateAmount'] = donateAmount;
    data['star'] = star;
    data['totalDonate'] = totalDonate;
    data['birthDate'] = birthDate;
    data['iccid'] = iccid;

    data['bloodId'] = bloodId;
    data['bloodGroup'] = bloodGroup;

    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}
