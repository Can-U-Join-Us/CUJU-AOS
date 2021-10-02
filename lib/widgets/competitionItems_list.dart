import 'package:flutter/material.dart';

class CompetitionItemsList extends StatelessWidget {
  String title;
  String description;
  DateTime dueDate;

  CompetitionItemsList(this.title, this.description, this.dueDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(description),
                      Text(
                        dueDate.toString(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Text("팀원 모집"),
                ),
                Expanded(
                  child: Text("댓글"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
