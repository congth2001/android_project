class Message{
  final int id;
  final bool my_account;
  final String img_url;
  final String message;
  final bool seen;
  Message({
    required this.id,
    required this.my_account,
    required this.img_url,
    required this.message,
    required this.seen
  });
}
List<Message> conversation=[
  Message(id: 0, my_account: false, img_url: '', message: 'Hello. My name is Andrew.', seen: true),
  Message(id: 1, my_account: true, img_url: '', message: 'Hi. Nice to meet you.', seen: true),
  Message(id: 2, my_account: false, img_url: '', message: 'I am a student. We will be roommate. I am happy and Are you happy also?', seen: true),
  Message(id: 3, my_account: true, img_url: '', message: 'Yes, certainly.', seen: true),
  Message(id: 4, my_account: false, img_url: '', message: 'Tomorrow, i want to meet you at the yard. Are you ready.', seen: true),
  Message(id: 5, my_account: true, img_url: '', message: 'Yes.', seen: true),
  Message(id: 6, my_account: false, img_url: '', message: 'What time are you free?', seen: true),
  Message(id: 7, my_account: true, img_url: '', message: '10.am, see you soon.', seen: false),
  Message(id: 8, my_account: true, img_url: '', message: '10.am, see you soon.', seen: false),
  Message(id: 9, my_account: true, img_url: '', message: '10.am, see you soon.', seen: false)
];