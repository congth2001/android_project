class Post {
  List<String>? images;
  Null? videos;
  List<String>? like;
  int? countComments;
  bool? isLike;
  String? sId;
  String? author;
  String? described;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Post(
      {this.images,
      this.videos,
      this.like,
      this.countComments,
      this.isLike,
      this.sId,
      this.author,
      this.described,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Post.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    videos = json['videos'];
    like = json['like'].cast<String>();
    countComments = json['countComments'];
    isLike = json['isLike'];
    sId = json['_id'];
    author = json['author'];
    described = json['described'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['videos'] = this.videos;
    data['like'] = this.like;
    data['countComments'] = this.countComments;
    data['isLike'] = this.isLike;
    data['_id'] = this.sId;
    data['author'] = this.author;
    data['described'] = this.described;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
