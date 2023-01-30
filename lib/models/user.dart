class User {
  String? gender;
  List<String>? blockedInbox;
  String? sId;
  String? phoneNumber;
  String? password;
  String? username;
  String? avatar;
  String? coverImage;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? address;
  String? birthday;
  String? city;
  String? country;
  String? description;

  User(
      {this.gender,
      this.blockedInbox,
      this.sId,
      this.phoneNumber,
      this.password,
      this.username,
      this.avatar,
      this.coverImage,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.address,
      this.birthday,
      this.city,
      this.country,
      this.description});

  User.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    blockedInbox = json['blocked_inbox'].cast<String>();
    sId = json['_id'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    username = json['username'];
    avatar = json['avatar'];
    coverImage = json['cover_image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    address = json['address'];
    birthday = json['birthday'];
    city = json['city'];
    country = json['country'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['blocked_inbox'] = this.blockedInbox;
    data['_id'] = this.sId;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['cover_image'] = this.coverImage;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['address'] = this.address;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['country'] = this.country;
    data['description'] = this.description;
    return data;
  }
}

// List<User> users = [
//   new User(avatar: 'assets/adelle.jpg', username: 'Adelle ashjg sdjz'),
//   new User(avatar: 'assets/andrew.jpg', username: 'Andrew'),
//   new User(avatar: 'assets/andy.jpg', username: 'Andy'),
//   new User(avatar: 'assets/chris.jpg', username: 'Chris'),
//   new User(avatar: 'assets/john.jpg', username: 'John'),
//   new User(avatar: 'assets/joey.jpg', username: 'Joey'),
//   new User(avatar: 'assets/james.jpg', username: 'James'),
//   new User(avatar: 'assets/kalle.jpg', username: 'Kalle'),
//   new User(avatar: 'assets/kalle.jpg', username: 'Kalle'),
//   new User(avatar: 'assets/kalle.jpg', username: 'Kalle'),
//   new User(avatar: 'assets/kalle.jpg', username: 'Kalle'),
// ];
