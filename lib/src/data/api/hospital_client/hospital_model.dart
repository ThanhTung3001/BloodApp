class HospitalResponse {
  String? name;
  String? address;
  String? phoneNumber;
  int? userId;
  // String? mediaList;
  double? lat;
  double? long;
  // Null? register;
  // Null? userInfos;
  int? id;
  String? createBy;
  String? updateBy;
  String? updateTime;
  String? createUTC;

  HospitalResponse(
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

  HospitalResponse.fromJson(Map<String, dynamic> json) {
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
    // data['mediaList'] = this.mediaList;
    data['lat'] = lat;
    data['long'] = long;
    // data['register'] = this.register;
    // data['userInfos'] = this.userInfos;
    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}
