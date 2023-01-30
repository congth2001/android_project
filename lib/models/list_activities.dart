class Activity {
  final String avatar;
  final String name;

  Activity({required this.avatar, required this.name});
}

List<Activity> listOfActivities = [
  new Activity(
      avatar: 'assets/activities/attending.png', name: 'Attending ...'),
  new Activity(
      avatar: 'assets/activities/celebrating.png', name: 'Celebrating ...'),
  new Activity(avatar: 'assets/activities/drinking.png', name: 'Drinking ...'),
  new Activity(avatar: 'assets/activities/eating.png', name: 'Eating ...'),
  new Activity(
      avatar: 'assets/activities/listening.png', name: 'Listening ...'),
  new Activity(avatar: 'assets/activities/looking.png', name: 'Looking ...'),
  new Activity(avatar: 'assets/activities/playing.png', name: 'Playing ...'),
  new Activity(avatar: 'assets/activities/reading.png', name: 'Reading ...'),
  new Activity(
      avatar: 'assets/activities/supporting.png', name: 'Supporting ...'),
  new Activity(avatar: 'assets/activities/thinking.png', name: 'Thinking ...'),
  new Activity(avatar: 'assets/activities/travel.png', name: 'Traveling ...'),
  new Activity(avatar: 'assets/activities/watching.png', name: 'Watching ...'),
];
