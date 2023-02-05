class Report {
  Id? iId;
  Id? post;
  Id? reporter;
  String? subject;
  String? details;
  int? created;
  int? modified;
  int? iV;

  Report(
      {this.iId,
      this.post,
      this.reporter,
      this.subject,
      this.details,
      this.created,
      this.modified,
      this.iV});

  Report.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    post = json['post'] != null ? new Id.fromJson(json['post']) : null;
    reporter =
        json['reporter'] != null ? new Id.fromJson(json['reporter']) : null;
    subject = json['subject'];
    details = json['details'];
    created = json['created'];
    modified = json['modified'];
    iV = json['_v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    if (this.reporter != null) {
      data['reporter'] = this.reporter!.toJson();
    }
    data['subject'] = this.subject;
    data['details'] = this.details;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['_v'] = this.iV;
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
