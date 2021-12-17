import 'package:canyoujoinus/providers/project_provider.dart';
import 'package:canyoujoinus/widgets/projectItems_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FrontendPage extends StatelessWidget {
  static const routeName = "/frontend";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "프론트엔드",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.78,
                child: Container(
                  child: ListView.builder(
                    itemBuilder:
                        (BuildContext context, int index) =>
                        ProjectItemsList(
                          Provider.of<ProjectProvider>(context, listen : false).selectItems[index].id,
                          Provider.of<ProjectProvider>(context, listen : false).selectItems[index].pid,
                          Provider.of<ProjectProvider>(context, listen : false).selectItems[index].title,
                          Provider.of<ProjectProvider>(context, listen : false).selectItems[index].description,
                          Provider.of<ProjectProvider>(context, listen : false).selectItems[index].imageUrl,
                          Provider.of<ProjectProvider>(context, listen : false).selectItems[index].count,
                          Provider.of<ProjectProvider>(context, listen : false).selectItems[index].term,
                          Provider.of<ProjectProvider>(context, listen : false).selectItems[index].due,
                        ),
                    itemCount: Provider.of<ProjectProvider>(context, listen : false).selectItems.length,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
