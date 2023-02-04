class Post {
  String? id;
  List<PostImage>? image;
  Video? video;
  String? described;
  String? created;
  String? modified;
  String? like;
  String? comment;
  String? isLiked;
  String? isBlocked;
  String? canComment;
  String? canEdit;
  String? state;
  Author? author;

  Post(
      {this.id,
      this.image,
      this.video,
      this.described,
      this.created,
      this.modified,
      this.like,
      this.comment,
      this.isLiked,
      this.isBlocked,
      this.canComment,
      this.canEdit,
      this.state,
      this.author});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // PostImage
    if (json['image'] != null) {
      image = <PostImage>[];
      json['PostImage'].forEach((v) {
        image!.add(new PostImage.fromJson(v));
      });
    }
    // video
    video = json['video'] != null ? new Video.fromJson(json['video']) : null;
    described = json['described'];
    created = json['created'];
    modified = json['modified'];
    like = json['like'];
    comment = json['comment'];
    isLiked = json['is_liked'];
    isBlocked = json['is_blocked'];
    canComment = json['can_comment'];
    canEdit = json['can_edit'];
    state = json['state'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['video'] = this.video;
    data['described'] = this.described;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['like'] = this.like;
    data['comment'] = this.comment;
    data['is_liked'] = this.isLiked;
    data['is_blocked'] = this.isBlocked;
    data['can_comment'] = this.canComment;
    data['can_edit'] = this.canEdit;
    data['state'] = this.state;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    return data;
  }
}

class Author {
  String? id;
  String? username;
  String? avatar;

  Author({this.id, this.username, this.avatar});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Video {
  String? url;
  String? thumb;

  Video({this.url, this.thumb});

  Video.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['thumb'] = this.thumb;
    return data;
  }
}

class PostImage {
  String? id;
  String? url;

  PostImage({this.id, this.url});

  PostImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
