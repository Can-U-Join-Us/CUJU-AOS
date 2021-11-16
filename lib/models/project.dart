class Project {
  late String title;
  late String description;
  late int count;
  late DateTime startDate;
  late DateTime endDate;

  Project({
    required this.title, required this.description, required this.count, required this.startDate, required this.endDate});
}

class ProjectItems {
  List<Project> projectItems = [
    Project(
      title: "리액트 프로그래밍",
      description: "할 사람 찾는다",
      count: 4,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
    Project(
      title: "안드로이드 어플 만들어요!",
      description: "할 사람 찾는다",
      count: 3,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
    Project(
      title: "뭐라할까",
      description: "할 사람 찾는다",
      count: 4,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
    Project(
      title: "또잉또잉",
      description: "123456",
      count: 4,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
  ];

  List<Project> get items {
    return [...projectItems];
  }

  int get itemCount {
    return projectItems.length;
  }
}
