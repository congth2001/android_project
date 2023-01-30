class UserNotification {
  final String avatar;
  final String content;
  final String time;

  UserNotification(
      {required this.avatar, required this.content, required this.time});
}

List<UserNotification> notifications = [
  new UserNotification(
      avatar: 'assets/goalcast.png',
      content: 'Goalcast posted a new video',
      time: '3 hours ago'),
  new UserNotification(
      avatar: 'assets/playstation.jpg',
      content: 'Playstation posted a new video',
      time: '8 hours ago'),
  new UserNotification(
      avatar: 'assets/xbox.jpeg',
      content: 'Xbox posted a new video',
      time: '9 hours ago'),
  new UserNotification(
      avatar: 'assets/reddit.png',
      content: 'Reddit posted a new video',
      time: '22 hours ago'),
  new UserNotification(
      avatar: 'assets/linkedIn.jpg',
      content: 'Linkedin posted a new video',
      time: '1 day ago'),
  new UserNotification(
      avatar: 'assets/goalcast.png',
      content: 'Goalcast posted a new video',
      time: '4 days ago'),
  new UserNotification(
      avatar: 'assets/reddit.png',
      content: 'Reddit posted a new video',
      time: '6 days ago'),
  new UserNotification(
      avatar: 'assets/xbox.jpeg',
      content: 'Xbox posted a new video',
      time: '1 week ago'),
  new UserNotification(
      avatar: 'assets/linkedIn.jpg',
      content: 'Linkedin posted a new video',
      time: '3 weeks ago'),
  new UserNotification(
      avatar: 'assets/playstation.jpg',
      content: 'Playstation posted a new video',
      time: '1 month ago')
];
