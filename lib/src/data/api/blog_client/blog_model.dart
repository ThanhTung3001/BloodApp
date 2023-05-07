class ResponseBlogList {
  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;
  List<SingleDataBlog>? data;
  bool? succeeded;
  String? errors;
  String? message;

  ResponseBlogList(
      {this.pageNumber,
      this.pageSize,
      this.totalPages,
      this.totalRecords,
      this.data,
      this.succeeded,
      this.errors,
      this.message});

  ResponseBlogList.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    totalRecords = json['totalRecords'];
    if (json['data'] != null) {
      data = <SingleDataBlog>[];
      json['data'].forEach((v) {
        data!.add(SingleDataBlog.fromJson(v));
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

class SingleDataBlog {
  String? content;
  String? title;
  String? avatar;
  String? description;
  int? viewCount;
  String? publicTime;
  int? categoryId;
  Category? category;
  List<void>? blogTags;
  int? id;
  String? createBy;
  String? updateBy;
  String? updateTime;
  String? createUTC;

  SingleDataBlog(
      {this.content,
      this.title,
      this.avatar,
      this.description,
      this.viewCount,
      this.publicTime,
      this.categoryId,
      this.category,
      this.blogTags,
      this.id,
      this.createBy,
      this.updateBy,
      this.updateTime,
      this.createUTC});

  SingleDataBlog.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    title = json['title'];
    avatar = json['avatar'];
    description = json['description'];
    viewCount = json['viewCount'];
    publicTime = json['publicTime'];
    categoryId = json['categoryId'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['blogTags'] != null) {
      blogTags = <Null>[];
      json['blogTags'].forEach((v) {
        // blogTags!.add(void.fromJson(v));
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
    data['content'] = content;
    data['title'] = title;
    data['avatar'] = avatar;
    data['description'] = description;
    data['viewCount'] = viewCount;
    data['publicTime'] = publicTime;
    data['categoryId'] = categoryId;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (blogTags != null) {
      // data['blogTags'] = blogTags!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}

class Category {
  String? name;
  String? description;
  // void? avatar;
  int? id;
  String? createBy;
  String? updateBy;
  String? updateTime;
  String? createUTC;

  Category(
      {this.name,
      this.description,
      // this.avatar,
      this.id,
      this.createBy,
      this.updateBy,
      this.updateTime,
      this.createUTC});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    // avatar = json['avatar'];
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
    // data['avatar'] = avatar;
    data['id'] = id;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['createUTC'] = createUTC;
    return data;
  }
}
