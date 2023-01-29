class Activity {
  final String imageUrl;
  final String name;

  Activity({
    required this.imageUrl,
    required this.name
  });
}
List<Activity> listOfActivities = [
  new Activity(imageUrl: 'assets/activities/attending.png', name: 'Attending ...'),
  new Activity(imageUrl: 'assets/activities/celebrating.png', name: 'Celebrating ...'),
  new Activity(imageUrl: 'assets/activities/drinking.png', name: 'Drinking ...'),
  new Activity(imageUrl: 'assets/activities/eating.png', name: 'Eating ...'),
  new Activity(imageUrl: 'assets/activities/listening.png', name: 'Listening ...'),
  new Activity(imageUrl: 'assets/activities/looking.png', name: 'Looking ...'),
  new Activity(imageUrl: 'assets/activities/playing.png', name: 'Playing ...'),
  new Activity(imageUrl: 'assets/activities/reading.png', name: 'Reading ...'),
  new Activity(imageUrl: 'assets/activities/supporting.png', name: 'Supporting ...'),
  new Activity(imageUrl: 'assets/activities/thinking.png', name: 'Thinking ...'),
  new Activity(imageUrl: 'assets/activities/travel.png', name: 'Traveling ...'),
  new Activity(imageUrl: 'assets/activities/watching.png', name: 'Watching ...'),
];