import 'package:photo_picker_initial/models/comment.dart';

class Post {
  Id? iId;
  List<Id>? likedUser;
  List<Id>? comments;
  List<Id>? reportsPost;
  Id? author;
  String? described;
  String? status;
  int? created;
  int? modified;
  List<Image>? image;
  int? iV;

  Post(
      {this.iId,
      this.likedUser,
      this.comments,
      this.reportsPost,
      this.author,
      this.described,
      this.status,
      this.created,
      this.modified,
      this.image,
      this.iV});

  Post.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    if (json['likedUser'] != null) {
      likedUser = <Id>[];
      json['likedUser'].forEach((v) {
        likedUser!.add(new Id.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Id>[];
      json['comments'].forEach((v) {
        comments!.add(new Id.fromJson(v));
      });
    }
    if (json['reports_post'] != null) {
      reportsPost = <Id>[];
      json['reports_post'].forEach((v) {
        reportsPost!.add(new Id.fromJson(v));
      });
    }
    author = json['author'] != null ? new Id.fromJson(json['author']) : null;
    described = json['described'];
    status = json['status'];
    created = json['created'];
    modified = json['modified'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    if (this.likedUser != null) {
      data['likedUser'] = this.likedUser!.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.reportsPost != null) {
      data['reports_post'] = this.reportsPost!.map((v) => v.toJson()).toList();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['described'] = this.described;
    data['status'] = this.status;
    data['created'] = this.created;
    data['modified'] = this.modified;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}

class Image {
  Id? iId;
  String? filename;
  String? url;

  Image({this.iId, this.filename, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    filename = json['filename'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['filename'] = this.filename;
    data['url'] = this.url;
    return data;
  }
}
