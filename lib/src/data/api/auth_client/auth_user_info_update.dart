class UserInfoUpdate {
  int? id;
  String? createBy;
  String? updateBy;
  String? updateTime;
  String? createUTC;
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
  int? bloodId;
  String? address;
  String? hospitalId;

  UserInfoUpdate(
      {this.id,
      this.createBy,
      this.updateBy,
      this.updateTime,
      this.createUTC,
      this.appUserId,
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
      this.bloodId,
      this.hospitalId,
      this.address});

  UserInfoUpdate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    createUTC = json['createUTC'];
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
    address = json['address'];
    hospitalId = json['hospitalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
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
    data['address'] = address;
    data['hospitalId'] = hospitalId;
    return data;
  }
}
