import 'package:canyoujoinus/pages/competition_page.dart';
import 'package:flutter/material.dart';

class ProjectItemsGrid extends StatelessWidget {
  late String title;
  late String description;
  late int count;
  late DateTime startDate;
  late DateTime endDate;

  ProjectItemsGrid(
      this.title, this.description, this.count, this.startDate, this.endDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Column(
        children: <Widget>[
          Text(title),
          Text(description),
          Text(
            count.toString(),
          ),
        ],
      ),
    );
  }
}
