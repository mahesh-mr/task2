class ApiModel {
  bool? success;
  String? message;
  int? offset;
  int? limit;
  List<Photos>? photos;

  ApiModel({this.success, this.message, this.offset, this.limit, this.photos});

  ApiModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    offset = json['offset'];
    limit = json['limit'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  String? description;
  String? url;
  String? title;
  int? user;
  int? id;

  Photos({this.description, this.url, this.title, this.user, this.id});

  Photos.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    url = json['url'];
    title = json['title'];
    user = json['user'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['url'] = this.url;
    data['title'] = this.title;
    data['user'] = this.user;
    data['id'] = this.id;
    return data;
  }
}
