class Recruit {
  String id;
  String content;

  Recruit({required this.id, required this.content});
}

class RecruitItems {
  List<Recruit> recruitItems = [
    // Recruit(id: "고도현", content: "같이 프로젝트 할 사람?"),
    // Recruit(id: "고도현", content: "같이 프로젝트 할 사람?"),
    // Recruit(id: "고도현", content: "같이 프로젝트 할 사람?"),
    // Recruit(id: "고도현", content: "같이 프로젝트 할 사람?"),
    // Recruit(id: "고도현", content: "같이 프로젝트 할 사람?"),
    // Recruit(id: "고도현", content: "같이 프로젝트 할 사람?"),
  ];

  List<Recruit> get items {
    return [...recruitItems];
  }

  int get itemCount {
    return recruitItems.length;
  }
}
