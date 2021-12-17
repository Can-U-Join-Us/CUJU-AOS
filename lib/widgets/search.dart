import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  static const routeName = "/search";
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool pressExpanded = false;
  bool _scaleCheckBox = false;
  String _selectCategory = '여기에';
  String _selectPart = 'Front-End';

  List<String> category = ['공모전', '개인 프로젝트?'];
  List<String> part = ['Front-End', 'Back-End', 'Android', 'IOS', 'DevOps'];
  List<String> scaleRanges = ["토이", "시/도", "전국", "국제"];
  List<String> termRanges = ["1개월", "6개월", "1년", "미정"];
  Map<String, List<bool>> checkBoxValue = {
    "scale": [false, false, false, false],
    "term": [false, false, false, false]
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "검색",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 8),
          width: double.infinity,
          child: pressExpanded
              ? Column(
                  children: <Widget>[
                    defaultSearchBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "프로젝트\n규모",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: 50,
                          child: buildListViewCheckBox("scale"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "제작 기간",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: 50,
                          child: buildListViewCheckBox("term"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("카테고리"),
                        DropdownButton(
                          value: _selectCategory,
                          items: category
                              .map(
                                (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value.toString(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(
                              () {
                                _selectCategory = value as String;
                              },
                            );
                          },
                        ),
                        Text("모집 부분"),
                        DropdownButton(
                          value: _selectPart,
                          items: part
                              .map(
                                (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value.toString(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(
                              () {
                                _selectPart = value as String;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                )
              : defaultSearchBox(),
        ),
      ),
    );
  }

  Widget defaultSearchBox() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: "검색어를 입력해주세요."),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                pressExpanded = !pressExpanded;
              });
            },
            child: pressExpanded ? Text("접기") : Text("펼치기"),
          ),
        ],
      ),
    );
  }

  Widget buildListViewCheckBox(String type) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        if (type == "scale") {
          return buildCheckBox(scaleRanges[index], type, index);
        } else {
          return buildCheckBox(termRanges[index], type, index);
        }
      },
      itemCount: 4,
    );
  }

  Widget buildCheckBox(String keyword, String type, int index) {
    if (type == "scale") {
      return Container(
        height: 30,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: checkBoxValue[type]![index],
              onChanged: (value) {
                setState(
                  () {
                    checkBoxValue[type]![index] = value!;
                  },
                );
              },
            ),
            Text(keyword),
          ],
        ),
      );
    } else {
      return Container(
        height: 30,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: checkBoxValue["term"]![index],
              onChanged: (value) {
                setState(
                  () {
                    checkBoxValue["term"]![index] = value!;
                  },
                );
              },
            ),
            Text(keyword),
          ],
        ),
      );
    }
  }

  Widget buildDropDownButton(List<String> listItems) {
    late String _dropdownValue = listItems[0];
    return DropdownButton(
      value: _dropdownValue,
      items: listItems
          .map((value) =>
              DropdownMenuItem(value: value, child: Text(value.toString())))
          .toList(),
      onChanged: (value) {
        setState(
          () {
            _dropdownValue = value as String;
          },
        );
      },
    );
  }
}
