class Project {
  late int id;
  late int pid;
  late String title;
  late String description;
  late String imageUrl;
  late int count;
  late int term;
  late String due;

  Project(
      {required this.id,
      required this.pid,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.count,
      required this.term,
      required this.due});
}
