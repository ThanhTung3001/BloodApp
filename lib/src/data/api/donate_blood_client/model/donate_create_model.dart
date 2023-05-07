class DonateCreateModel {
  int? bloodGroupId;
  int? capacity;
  int? hospitalId;
  int? userId;
  int? status;
  String? registerTime;

  DonateCreateModel(
      {this.bloodGroupId,
      this.capacity,
      this.hospitalId,
      this.userId,
      this.status,
      this.registerTime});

  DonateCreateModel.fromJson(Map<String, dynamic> json) {
    bloodGroupId = json['bloodGroupId'];
    capacity = json['capacity'];
    hospitalId = json['hospitalId'];
    userId = json['userId'];
    status = json['status'];
    registerTime = json['registerTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bloodGroupId'] = bloodGroupId;
    data['capacity'] = capacity;
    data['hospitalId'] = hospitalId;
    data['userId'] = userId;
    data['status'] = status;
    data['registerTime'] = registerTime;
    return data;
  }
}
