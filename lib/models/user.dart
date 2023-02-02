class User {
  Id? iId;
  bool? isBlocked;
  List<Id>? friendRequestSent;
  String? description;
  String? phoneNumber;
  String? password;
  bool? isVerified;
  RegisterDate? registerDate;
  List<Friends>? friends;
  List<BlockedUsers>? blockedList;
  List<FriendRequests>? friendRequestReceived;
  RegisterDate? createdAt;
  int? iV;
  RegisterDate? timeLastRequestGetVerifyCode;
  RegisterDate? dateLogin;
  String? name;
  String? address;
  String? city;
  String? country;
  String? avatar;
  String? coverImage;

  User(
      {this.iId,
      this.isBlocked,
      this.friendRequestSent,
      this.description,
      this.phoneNumber,
      this.password,
      this.isVerified,
      this.registerDate,
      this.friends,
      this.blockedList,
      this.friendRequestReceived,
      this.createdAt,
      this.iV,
      this.timeLastRequestGetVerifyCode,
      this.dateLogin,
      this.name,
      this.address,
      this.city,
      this.country,
      this.avatar,
      this.coverImage});

  User.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    isBlocked = json['isBlocked'];
    if (json['friendRequestSent'] != null) {
      friendRequestSent = <Id>[];
      json['friendRequestSent'].forEach((v) {
        friendRequestSent!.add(new Id.fromJson(v));
      });
    }
    description = json['description'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    isVerified = json['isVerified'];
    registerDate = json['registerDate'] != null
        ? new RegisterDate.fromJson(json['registerDate'])
        : null;
    if (json['friends'] != null) {
      friends = <Friends>[];
      json['friends'].forEach((v) {
        friends!.add(new Friends.fromJson(v));
      });
    }
    if (json['blockedList'] != null) {
      blockedList = <BlockedUsers>[];
      json['blockedList'].forEach((v) {
        blockedList!.add(new BlockedUsers.fromJson(v));
      });
    }
    if (json['friendRequestReceived'] != null) {
      friendRequestReceived = <FriendRequests>[];
      json['friendRequestReceived'].forEach((v) {
        friendRequestReceived!.add(new FriendRequests.fromJson(v));
      });
    }
    createdAt = json['createdAt'] != null
        ? new RegisterDate.fromJson(json['createdAt'])
        : null;
    iV = json['__v'];
    timeLastRequestGetVerifyCode = json['timeLastRequestGetVerifyCode'] != null
        ? new RegisterDate.fromJson(json['timeLastRequestGetVerifyCode'])
        : null;
    dateLogin = json['dateLogin'] != null
        ? new RegisterDate.fromJson(json['dateLogin'])
        : null;
    name = json['name'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    avatar = json['avatar'];
    coverImage = json['coverImage'];
  }

  // Map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['isBlocked'] = this.isBlocked;
    if (this.friendRequestSent != null) {
      data['friendRequestSent'] =
          this.friendRequestSent!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['isVerified'] = this.isVerified;
    if (this.registerDate != null) {
      data['registerDate'] = this.registerDate!.toJson();
    }
    if (this.friends != null) {
      data['friends'] = this.friends!.map((v) => v.toJson()).toList();
    }
    if (this.blockedList != null) {
      data['blockedList'] = this.blockedList!.map((v) => v.toJson()).toList();
    }
    if (this.friendRequestReceived != null) {
      data['friendRequestReceived'] =
          this.friendRequestReceived!.map((v) => v.toJson()).toList();
    }
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt!.toJson();
    }
    data['__v'] = this.iV;
    if (this.timeLastRequestGetVerifyCode != null) {
      data['timeLastRequestGetVerifyCode'] =
          this.timeLastRequestGetVerifyCode!.toJson();
    }
    if (this.dateLogin != null) {
      data['dateLogin'] = this.dateLogin!.toJson();
    }
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['avatar'] = this.avatar;
    data['coverImage'] = this.coverImage;
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

class RegisterDate {
  Date? date;

  RegisterDate({this.date});

  RegisterDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'] != null ? new Date.fromJson(json['$date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.date != null) {
      data['$date'] = this.date!.toJson();
    }
    return data;
  }
}

class Date {
  String? numberLong;

  Date({this.numberLong});

  Date.fromJson(Map<String, dynamic> json) {
    numberLong = json['$numberLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberLong'] = this.numberLong;
    return data;
  }
}

class Friends {
  Id? iId;
  Id? friend;
  RegisterDate? createdAt;

  Friends({this.iId, this.friend, this.createdAt});

  Friends.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    friend = json['friend'] != null ? new Id.fromJson(json['friend']) : null;
    createdAt = json['createdAt'] != null
        ? new RegisterDate.fromJson(json['createdAt'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    if (this.friend != null) {
      data['friend'] = this.friend!.toJson();
    }
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt!.toJson();
    }
    return data;
  }
}

class BlockedUsers {
  Id? iId;
  Id? user;
  RegisterDate? createdAt;

  BlockedUsers({this.iId, this.user, this.createdAt});

  BlockedUsers.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    user = json['user'] != null ? new Id.fromJson(json['user']) : null;
    createdAt = json['createdAt'] != null
        ? new RegisterDate.fromJson(json['createdAt'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt!.toJson();
    }
    return data;
  }
}

class FriendRequests {
  Id? iId;
  Id? fromUser;
  RegisterDate? lastCreated;

  FriendRequests({this.iId, this.fromUser, this.lastCreated});

  FriendRequests.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    fromUser =
        json['fromUser'] != null ? new Id.fromJson(json['fromUser']) : null;
    lastCreated = json['lastCreated'] != null
        ? new RegisterDate.fromJson(json['lastCreated'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    if (this.fromUser != null) {
      data['fromUser'] = this.fromUser!.toJson();
    }
    if (this.lastCreated != null) {
      data['lastCreated'] = this.lastCreated!.toJson();
    }
    return data;
  }
}
