class Comment {
  Id? iId;
  String? comment;
  Id? post;
  Poster? poster;
  String? created;
  String? modified;
  String? iV;

  Comment(
      {this.iId,
      this.comment,
      this.poster,
      this.post,
      this.created,
      this.modified,
      this.iV});

  Comment.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    comment = json['comment'];
    poster =
        json['poster'] != null ? new Poster.fromJson(json['poster']) : null;
    post = json['post'] != null ? new Id.fromJson(json['post']) : null;
    created = json['created'];
    modified = json['modified'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['comment'] = this.comment;
    if (this.poster != null) {
      data['poster'] = this.poster!.toJson();
    }
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    data['created'] = this.created;
    data['modified'] = this.modified;
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

class Poster {
  String? id;
  String? name;
  String? avatar;

  Poster({this.id, this.name, this.avatar});

  Poster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}
