import 'package:canyoujoinus/widgets/search.dart';

import '/models/competition.dart';
import 'package:canyoujoinus/widgets/competitionItems_list.dart';
import 'package:flutter/material.dart';

class CompetitionPage extends StatelessWidget {
  static const routeName = '/competition-page';

  const CompetitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "공모전 탐색",
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
              SearchWidget(),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Container(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        CompetitionItemsList(
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
    );
  }
}
