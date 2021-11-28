import '/models/competition.dart';
import '/pages/navigations/contest_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContestItemsList extends StatelessWidget {
  String title;
  String description;
  String dueDate;
  String imageUrl;

  ContestItemsList(this.title, this.description, this.dueDate, this.imageUrl);

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
                        dueDate.toString(),
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
                            "D-${(DateTime.parse(dueDate).difference(DateTime.now())).inDays.toString()}",
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
            dueDate: this.dueDate,
            imageUrl: this.imageUrl,
          ),
        );
      },
    );
  }
}
