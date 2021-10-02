import '/model/competition.dart';
import 'package:canyoujoinus/widgets/competitionItems_list.dart';
import 'package:flutter/material.dart';

class CompetitionPage extends StatelessWidget {
  static const routeName = '/competition-page';

  const CompetitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => CompetitionItemsList(
          CompetitionItems().items[index].title,
          CompetitionItems().items[index].description,
          CompetitionItems().items[index].dueDate),
      itemCount: CompetitionItems().itemCount,
    );
  }
}
