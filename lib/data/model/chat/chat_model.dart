class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avtarUrl;
  final bool online;
  final bool seen;

  ChatModel(
      {required this.name,
      required this.message,
      required this.time,
      required this.avtarUrl,
      required this.online,
      required this.seen});
}

List<ChatModel> dummyData = [
  ChatModel(
      name: "Ayyoob",
      message: "hey",
      time: "9:45",
      avtarUrl:
          "https://images.pexels.com/photos/20393504/pexels-photo-20393504/free-photo-of-a-woman-taking-a-picture-of-a-cherry-blossom-tree.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      online: false,
      seen: true),
  ChatModel(
      name: "Tina",
      message: "whats up mhn",
      time: "3:45",
      avtarUrl:
          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: true,
      seen: false),
  ChatModel(
      name: "romeo",
      message: "piece of cake",
      time: "9:45",
      avtarUrl:
          "https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: true,
      seen: false),
  ChatModel(
      name: "Fera",
      message: "Nope!",
      time: "19:30",
      avtarUrl:
          "https://images.pexels.com/photos/432059/pexels-photo-432059.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: false,
      seen: true),
  ChatModel(
      name: "Orkido",
      message: "Lets take a nap buddy",
      time: "9:45",
      avtarUrl:
          "https://images.pexels.com/photos/1759530/pexels-photo-1759530.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: false,
      seen: true),
  ChatModel(
      name: "Hermoinee",
      message: "Dumble dore called you mhn",
      time: "9:45",
      avtarUrl:
          "https://images.pexels.com/photos/1310474/pexels-photo-1310474.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: false,
      seen: true),
  ChatModel(
      name: "Ayyoob",
      message: "hey",
      time: "9:45",
      avtarUrl:
          "https://images.pexels.com/photos/20393504/pexels-photo-20393504/free-photo-of-a-woman-taking-a-picture-of-a-cherry-blossom-tree.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      online: false,
      seen: true),
  ChatModel(
      name: "Tina",
      message: "whats up mhn",
      time: "3:45",
      avtarUrl:
          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: true,
      seen: false),
  ChatModel(
      name: "romeo",
      message: "piece of cake",
      time: "9:45",
      avtarUrl:
          "https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: true,
      seen: false),
  ChatModel(
      name: "Fera",
      message: "Nope!",
      time: "19:30",
      avtarUrl:
          "https://images.pexels.com/photos/432059/pexels-photo-432059.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: false,
      seen: true),
  ChatModel(
      name: "Brokie",
      message: "Lets catch up",
      time: "9:45",
      avtarUrl:
          "https://images.pexels.com/photos/1278566/pexels-photo-1278566.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: false,
      seen: true),
  ChatModel(
      name: "Tina",
      message: "today off day",
      time: "3:45",
      avtarUrl:
          "https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&w=1200",
      online: true,
      seen: false),
];
