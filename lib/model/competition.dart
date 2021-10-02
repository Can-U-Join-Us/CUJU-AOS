class Competition {
  late String title;
  late String description;
  late DateTime dueDate;

  Competition({
    required this.title, required this.description, required this.dueDate});
}

class CompetitionItems {
  List<Competition> competitionItems = [
    Competition(
      title: "컴퓨터구조 공모전",
      description: "뇌섹남 김교수",
      dueDate: DateTime.now().add(Duration(days: 7)),
    ),
  ];

  List<Competition> get items {
    return [...competitionItems];
  }

  int get itemCount {
    return competitionItems.length;
  }
}
