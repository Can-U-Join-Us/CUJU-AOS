import 'package:canyoujoinus/models/competition.dart';
import 'package:canyoujoinus/pages/posts/add_project.dart';
import 'package:flutter/material.dart';

class ContestListPage extends StatelessWidget {
  static const routeName = "/contest-list";

  // void _selectContestItem(BuildContext context, String title) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext ctx) {
  //       return AlertDialog(
  //         content: Text("$title을 선택하시겠어요?"),
  //         actions: [
  //           FlatButton(
  //             child: Text("예"),
  //             onPressed: () {
  //               Navigator.of(context).pop(title);
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           FlatButton(
  //             child: Text("아니오"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "진행중인 공모전",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 3),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.height * 0.15,
                              padding: EdgeInsets.all(10),
                              child: Image(
                                image: NetworkImage(
                                    CompetitionItems().items[index].imageUrl),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              margin: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    CompetitionItems().items[index].title,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    CompetitionItems()
                                        .items[index]
                                        .dueDate
                                        .toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop(CompetitionItems().items[index].title);
                      },
                    );
                  },
                  itemCount: CompetitionItems().itemCount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
