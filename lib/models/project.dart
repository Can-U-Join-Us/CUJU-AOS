class Project {
  late int id;
  late int pid;
  late String title;
  late String description;
  late String imageUrl;
  late int count;
  late int term;
  late String due;
  int aos = 0;
  int ios = 0;
  int fe = 0;
  int be = 0;
  int design = 0;
  int pm = 0;
  int devops = 0;
  int etc = 0;

  // Project({
  //   required this.id,
  //   required this.pid,
  //   required this.title,
  //   required this.description,
  //   required this.imageUrl,
  //   required this.count,
  //   required this.term,
  //   required this.due,
  // });

  Project({
    required this.id,
    required this.pid,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.count,
    required this.term,
    required this.due,
    required this.aos,
    required this.ios,
    required this.fe,
    required this.be,
    required this.design,
    required this.pm,
    required this.devops,
    required this.etc,
  });
}
