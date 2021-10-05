import 'package:flutter/material.dart';

class CompetitionItemsList extends StatelessWidget {
  String title;
  String description;
  String dueDate;
  String imageUrl;

  CompetitionItemsList(
      this.title, this.description, this.dueDate, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).accentColor, width: 3),
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
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
                Text(
                  dueDate.toString(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
