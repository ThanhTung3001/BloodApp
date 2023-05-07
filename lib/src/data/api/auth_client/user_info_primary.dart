class ReponseUserInfoPrimary {
  Data? data;
  String? message;

  ReponseUserInfoPrimary({this.data, this.message});

  ReponseUserInfoPrimary.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  List<void>? userRoles;
  UserInfo? userInfo;
  int? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  String? lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  Data(
      {this.firstName,
      this.lastName,
      this.userRoles,
      this.userInfo,
      this.id,
      this.userName,
      this.normalizedUserName,
      this.email,
      this.normalizedEmail,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.concurrencyStamp,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.twoFactorEnabled,
      this.lockoutEnd,
      this.lockoutEnabled,
      this.accessFailedCount});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];

    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;

    if (userInfo != null) {
      data['userInfo'] = userInfo!.toJson();
    }
    data['id'] = id;
    data['userName'] = userName;
    data['normalizedUserName'] = normalizedUserName;
    data['email'] = email;
    data['normalizedEmail'] = normalizedEmail;
    data['emailConfirmed'] = emailConfirmed;
    data['passwordHash'] = passwordHash;
    data['securityStamp'] = securityStamp;
    data['concurrencyStamp'] = concurrencyStamp;
    data['phoneNumber'] = phoneNumber;
    data['phoneNumberConfirmed'] = phoneNumberConfirmed;
    data['twoFactorEnabled'] = twoFactorEnabled;
    data['lockoutEnd'] = lockoutEnd;
    data['lockoutEnabled'] = lockoutEnabled;
    data['accessFailedCount'] = accessFailedCount;
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
  String? address;
  String? note;
  int? weight;
  int? hospitalId;
  int? id;
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
      this.address,
      this.note,
      this.weight,
      this.hospitalId,
      this.id,
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

    address = json['address'];
    note = json['note'];
    weight = json['weight'];

    hospitalId = json['hospitalId'];
    id = json['id'];

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

    data['address'] = address;
    data['note'] = note;
    data['weight'] = weight;

    data['hospitalId'] = hospitalId;
    data['id'] = id;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}
