class User {
  String? id;
  String? username;
  String? created;
  String? description;
  String? avatar;
  String? coverImage;
  String? link;
  String? address;
  String? city;
  String? country;
  String? listing;
  String? isFriend;

  User(
      {this.id,
      this.username,
      this.created,
      this.description,
      this.avatar,
      this.coverImage,
      this.link,
      this.address,
      this.city,
      this.country,
      this.listing,
      this.isFriend});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    created = json['created'];
    description = json['description'];
    avatar = json['avatar'];
    coverImage = json['cover_image'];
    link = json['link'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    listing = json['listing'];
    isFriend = json['is_friend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['created'] = this.created;
    data['description'] = this.description;
    data['avatar'] = this.avatar;
    data['cover_image'] = this.coverImage;
    data['link'] = this.link;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['listing'] = this.listing;
    data['is_friend'] = this.isFriend;
    return data;
  }
}
