class Like{
  final String imageUrlUser;
  final String nameUser;
  final int numberMutualFriends;
  final bool isFriend;
  Like({
    required this.nameUser,
    required this.imageUrlUser,
    required this.numberMutualFriends,
    required this.isFriend
  });
}
List<Like> listOfLikePersons=[
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: false),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: true),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: false),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: false),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: false),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: true),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: false),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: false),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: false),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: true),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: true),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: true),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: true),
  Like(imageUrlUser: 'assets/andrew.jpg', nameUser: 'Andrew', numberMutualFriends: 10, isFriend: true),
];