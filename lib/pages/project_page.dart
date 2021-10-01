import 'package:canyoujoinus/model/project.dart';
import 'package:canyoujoinus/widgets/proejctItems_grid.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  static const routeName = "/project-page";

  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) => ProjectItemsGrid(
              ProjectItems().items[index].title,
              ProjectItems().items[index].description,
              ProjectItems().items[index].count,
              ProjectItems().items[index].startDate,
              ProjectItems().items[index].endDate),
          itemCount: ProjectItems().itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
