import '/models/competition.dart';
import '/pages/navigations/contest_page.dart';
import 'package:flutter/material.dart';

class ProjectItemsList extends StatelessWidget {
  late int id;
  late int pid;
  late String title;
  late String description;
  late String imageUrl;
  late int count;
  late int term;
  late String due;

  ProjectItemsList(this.id, this.pid, this.title, this.description, this.imageUrl, this.count, this.term, this.due);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 0.15,
              padding: EdgeInsets.all(10),
              child: Image(
                image: NetworkImage(imageUrl),
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
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    style: TextStyle(fontSize: 10,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "모집 마감밀 : ${due}",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "D-${(DateTime.parse(due).difference(DateTime.now())).inDays.toString()}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          ContestPage.routeName,
          arguments: Competition(
            title: this.title,
            description: this.description,
            dueDate: this.due,
            imageUrl: this.imageUrl,
          ),
        );
      },
    );
  }
}
