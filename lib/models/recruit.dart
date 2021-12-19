class Recruit {
  String id;
  String content;

  Recruit({required this.id, required this.content});
}

class RecruitItems {
  List<Recruit> recruitItems = [];

  List<Recruit> get items {
    return [...recruitItems];
  }

  int get itemCount {
    return recruitItems.length;
  }
}
