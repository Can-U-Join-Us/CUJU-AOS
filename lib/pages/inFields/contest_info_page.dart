import 'package:canyoujoinus/models/competition.dart';
import 'package:canyoujoinus/models/recruit.dart';
import 'package:canyoujoinus/pages/posts/add_project.dart';
import 'package:flutter/material.dart';

class CompetitionInfoPage extends StatefulWidget {
  static const routeName = '/competition-page';

  const CompetitionInfoPage({Key? key}) : super(key: key);

  @override
  _CompetitionInfoPageState createState() => _CompetitionInfoPageState();
}

class _CompetitionInfoPageState extends State<CompetitionInfoPage>
    with SingleTickerProviderStateMixin {
  bool _initState = true;
  late TabController _tabController;
  late String _title;
  late String _description;
  late String _dueDate;
  late String _imageUrl;

  List<String> comments = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_initState) {
      Competition competition =
          ModalRoute.of(context)!.settings.arguments as Competition;
      _title = competition.title;
      _description = competition.description;
      _dueDate = competition.dueDate;
      _imageUrl = competition.imageUrl;
      _initState = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.height * 0.15,
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: NetworkImage(_imageUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          _title,
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              indicatorColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text(
                    "소개",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "팀원 모집",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "댓글",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
              controller: _tabController,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.67,
              child: TabBarView(
                children: <Widget>[
                  buildIntroduce(_description, _dueDate, _imageUrl),
                  buildRecruitMember(context),
                  buildReply(comments),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildIntroduce(String description, String dueDate, String imageUrl) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "접수 기간",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(dueDate),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "D-${(DateTime.parse(dueDate).difference(DateTime.now())).inDays.toString()}",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "설명",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(description),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Image(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ],
    ),
  );
}

Widget buildRecruitMember(BuildContext context) {
  List<Recruit> recruits = RecruitItems().items;
  return recruits.length == 0
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("작성된 모집 글이 없습니다."),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddProjectPage.routeName);
                  },
                  child: Text(
                    "팀원 모집글 게시하기",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, index) => Divider(),
            itemBuilder: (BuildContext context, index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(recruits[index].id),
                    SizedBox(height: 10),
                    Text(recruits[index].content),
                  ],
                ),
              );
            },
            itemCount: recruits.length,
          ),
        );
}

Widget buildReply(List<String> comments) {
  return comments.length == 0
      ? Center(
          child: Text("작성된 댓글이 없습니다."),
        )
      : Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, index) => Divider(),
            itemBuilder: (BuildContext context, index) {
              return Container(
                height: 100,
                child: Column(
                  children: <Widget>[
                    Text(comments[index]),
                    Text(comments[index]),
                  ],
                ),
              );
            },
            itemCount: comments.length,
          ),
        );
}
