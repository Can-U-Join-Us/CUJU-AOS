import 'package:intl/intl.dart';

class Competition {
  late String title;
  late String description;
  late String dueDate;
  late String imageUrl;

  Competition(
      {required this.title,
      required this.description,
      required this.dueDate,
      required this.imageUrl});
}

class CompetitionItems {
  List<Competition> competitionItems = [
    Competition(
        title: "블록체인 창업 아이디어 경진대회",
        description: "컴공 모두 모여~",
        dueDate: DateFormat('yyyy-MM-dd')
            .format(DateTime.now().add(Duration(days: 20))),
        imageUrl:
            "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5263%2F2021%2F09%2F22%2F22_556425_20210922144422382.jpg&type=a340"),
    Competition(
      title: "2021 판교 AI 챌린지",
      description: "다들 도전해봐!",
      dueDate: DateFormat('yyyy-MM-dd')
          .format(DateTime.now().add(Duration(days: 24))),
      imageUrl:
          "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5764%2F2021%2F09%2F06%2F0000090707_001_20210906102706617.jpg&type=a340",
    ),
    Competition(
      title: "응애 밥줘",
      description: "다들 도전해봐!",
      dueDate: DateFormat('yyyy-MM-dd')
          .format(DateTime.now().add(Duration(days: 75))),
      imageUrl:
          "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MTdfMTI0%2FMDAxNjMxODQ0OTUzMzI4.n9c01yCCAa0VHWD6JGwlnfps4VKQ4HhJ3LqeIaJkpO8g.2bi5cHVNWKlOBHtOz6f750zhjvYGrdjEF18x6QDIj1kg.JPEG.seoulglobalcenter%2F241449629_4588688631176780_3524314710995468304_n.jpg&type=a340"),
    Competition(
      title: "신한 금융 투자 마케팅 공모전",
      description: "다들 도전해봐!",
      dueDate: DateFormat('yyyy-MM-dd')
          .format(DateTime.now().add(Duration(days: 15))),
      imageUrl:
          "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MTdfMTg4%2FMDAxNjMxODUyODQyMzQ0.wRanGDJH-PuDoxHk9HHXVfMY6eFornmLE0cuSPc1kBkg.eW3HdqgvCOvQfcHymyYs0fABRwVbig_E3Re2Pj4h4zkg.JPEG.ggscw%2F%25C0%25CE%25BD%25C4%25B0%25B3%25BC%25B1-%25BB%25E7%25C1%25F8%25BF%25B5%25BB%25F3%25B0%25F8%25B8%25F0%25C0%25FC-%25C6%25F7%25BD%25BA%25C5%25CD-001.jpg&type=a340",
    ),
    Competition(
      title: "LG화학 대학생 광고 공모전",
      description: "다들 도전해봐!",
      dueDate: DateFormat('yyyy-MM-dd')
          .format(DateTime.now().add(Duration(days: 20))),
      imageUrl:
          "https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAyMTA4MjZfNjIg%2FMDAxNjI5OTA5ODE4MTAw.RaUrJ7FJYJmO4d5JECV25DMYMmbwPLWMVSzq1hzEd98g.lFQ0AttyehbpqUR-c9F8tfGqO_C0Flu583J4L2hNpDQg.JPEG%2FI8LZj2SGIJ7Hre-cUrj4gEGs2r8Y.jpg&type=a340",
    ),
  ];

  List<Competition> get items {
    return [...competitionItems];
  }

  int get itemCount {
    return competitionItems.length;
  }
}
