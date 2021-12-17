import 'package:canyoujoinus/models/project.dart';
import 'package:canyoujoinus/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectInfoPage extends StatefulWidget {
  static const routeName = "/project-info";

  const ProjectInfoPage({Key? key}) : super(key: key);

  @override
  _ProjectInfoPageState createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {
  late String _title;
  late String _desc;
  late String _due;
  late int term;

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    final pid = ModalRoute.of(context)!.settings.arguments as int;
    Provider.of<ProjectProvider>(context, listen : false).detailProject(pid);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height : MediaQuery.of(context).size.height * 0.75,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "접수 기간",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(_due),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "D-${(DateTime.parse(_due).difference(DateTime.now())).inDays.toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "설명",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(_desc),
              ],
            ),
          ),
          Container(
            child: Row(children: <Widget>[
              FlatButton(child: Text("참가하기"), onPressed: () {}),
            ]),
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
