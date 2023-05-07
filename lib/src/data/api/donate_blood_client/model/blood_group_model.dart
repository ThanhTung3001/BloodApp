class ResponseBloodGroup {
  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;
  List<Data>? data;
  bool? succeeded;
  String? errors;
  String? message;

  ResponseBloodGroup(
      {this.pageNumber,
      this.pageSize,
      this.totalPages,
      this.totalRecords,
      this.data,
      this.succeeded,
      this.errors,
      this.message});

  ResponseBloodGroup.fromJson(Map<String, dynamic> json) {
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
  String? description;
  bool? urgent;
  int? capacity;
  String? avatar;
  int? id;
  String? createBy;
  String? updateBy;
  String? updateTime;
  String? createUTC;

  Data(
      {this.name,
      this.description,
      this.urgent,
      this.capacity,
      this.avatar,
      this.id,
      this.createBy,
      this.updateBy,
      this.updateTime,
      this.createUTC});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    urgent = json['urgent'];
    capacity = json['capacity'];
    avatar = json['avatar'];

    id = json['id'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    createUTC = json['createUTC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['urgent'] = urgent;
    data['capacity'] = capacity;
    data['avatar'] = avatar;

    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}
