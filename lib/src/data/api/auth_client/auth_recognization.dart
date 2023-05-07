class ResponseReconizeID {
  int? errorCode;
  String? errorMessage;
  List<Data>? data;

  ResponseReconizeID({this.errorCode, this.errorMessage, this.data});

  ResponseReconizeID.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? idProb;
  String? name;
  String? nameProb;
  String? dob;
  String? dobProb;
  String? sex;
  String? sexProb;
  String? nationality;
  String? nationalityProb;
  String? home;
  String? homeProb;
  String? address;
  String? addressProb;
  String? doe;
  String? doeProb;
  String? overallScore;
  AddressEntities? addressEntities;
  String? typeNew;
  String? type;

  Data(
      {this.id,
      this.idProb,
      this.name,
      this.nameProb,
      this.dob,
      this.dobProb,
      this.sex,
      this.sexProb,
      this.nationality,
      this.nationalityProb,
      this.home,
      this.homeProb,
      this.address,
      this.addressProb,
      this.doe,
      this.doeProb,
      this.overallScore,
      this.addressEntities,
      this.typeNew,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProb = json['id_prob'];
    name = json['name'];
    nameProb = json['name_prob'];
    dob = json['dob'];
    dobProb = json['dob_prob'];
    sex = json['sex'];
    sexProb = json['sex_prob'];
    nationality = json['nationality'];
    nationalityProb = json['nationality_prob'];
    home = json['home'];
    homeProb = json['home_prob'];
    address = json['address'];
    addressProb = json['address_prob'];
    doe = json['doe'];
    doeProb = json['doe_prob'];
    overallScore = json['overall_score'];
    addressEntities = json['address_entities'] != null
        ? AddressEntities.fromJson(json['address_entities'])
        : null;
    typeNew = json['type_new'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_prob'] = idProb;
    data['name'] = name;
    data['name_prob'] = nameProb;
    data['dob'] = dob;
    data['dob_prob'] = dobProb;
    data['sex'] = sex;
    data['sex_prob'] = sexProb;
    data['nationality'] = nationality;
    data['nationality_prob'] = nationalityProb;
    data['home'] = home;
    data['home_prob'] = homeProb;
    data['address'] = address;
    data['address_prob'] = addressProb;
    data['doe'] = doe;
    data['doe_prob'] = doeProb;
    data['overall_score'] = overallScore;
    if (addressEntities != null) {
      data['address_entities'] = addressEntities!.toJson();
    }
    data['type_new'] = typeNew;
    data['type'] = type;
    return data;
  }
}

class AddressEntities {
  String? province;
  String? district;
  String? ward;
  String? street;

  AddressEntities({this.province, this.district, this.ward, this.street});

  AddressEntities.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    district = json['district'];
    ward = json['ward'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['province'] = province;
    data['district'] = district;
    data['ward'] = ward;
    data['street'] = street;
    return data;
  }
}
