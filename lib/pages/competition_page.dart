import 'package:canyoujoinus/widgets/search.dart';

import '/model/competition.dart';
import 'package:canyoujoinus/widgets/competitionItems_list.dart';
import 'package:flutter/material.dart';

class CompetitionPage extends StatelessWidget {
  static const routeName = '/competition-page';

  const CompetitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("공모전")),
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
