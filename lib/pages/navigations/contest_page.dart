import 'package:canyoujoinus/pages/posts/add_project.dart';
import 'package:canyoujoinus/widgets/search.dart';
import '/pages/inFields/search_page.dart';
import '/models/competition.dart';
import 'package:canyoujoinus/widgets/contestItems_list.dart';
import 'package:flutter/material.dart';

class ContestPage extends StatefulWidget {
  static const routeName = '/competition-page';

  const ContestPage({Key? key}) : super(key: key);

  @override
  _ContestPageState createState() => _ContestPageState();
}

class _ContestPageState extends State<ContestPage> {
  int _regist = -1;

  Future<void> _refresh() async {
  }

  Future<void> _checkValidation(BuildContext context) async {
    // await로 Provider로 서버에서 등록 여부 판단하는 메소드 추가
    if (_regist == -1) {
      // 미등록
      _showMessage(context, "주최자 미등록", "주최자 등록이 필요합니다.");
      // await로 Provider로 서버에 전송하는 메소드 추가
    } else if (_regist == 0) {
      // 등록했는데 허가 X
      _showMessage(context, "주최자 등록 대기", "현재 주최자 등록 대기 상태입니다.");
    } else {
      // 등록
      Navigator.of(context).pushNamed(AddProjectPage.routeName);
    }
  }

  void _showMessage(
      BuildContext context, String titleText, String contentText) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(titleText),
          content: Text(contentText),
          actions: _regist == 0
              ? [
                  FlatButton(
                    child: Text("예"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]
              : [
                  FlatButton(
                    child: Text("예"),
                    onPressed: () async {
                      await _updateRegistState();
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("아니오"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
        );
      },
    );
  }

  Future<void> _updateRegistState() async {
    // await로 Provider로 서버에 업데이트 하는 메소드 추가
    setState(() {
      _regist = 0; // 등록 대기중
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("신청이 완료되었습니다."),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "공모전 탐색",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).pushNamed(SearchWidget.routeName);
              },
            )
          ],
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: RefreshIndicator(
          onRefresh: () => _refresh(),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.78,
                    child: Container(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) =>
                            ContestItemsList(
                          CompetitionItems().items[index].title,
                          CompetitionItems().items[index].description,
                          CompetitionItems().items[index].dueDate,
                          CompetitionItems().items[index].imageUrl,
                        ),
                        itemCount: CompetitionItems().itemCount,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          onPressed: () {
            _checkValidation(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
