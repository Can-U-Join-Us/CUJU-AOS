import 'dart:io';

import 'package:canyoujoinus/pages/posts/contest_list_page.dart';
import 'package:canyoujoinus/providers/project_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({Key? key}) : super(key: key);
  static const routeName = "/add-project";

  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final formKey = GlobalKey<FormState>();
  int _frontCnt = 0;
  int _backCnt = 0;
  int _aosCnt = 0;
  int _iosCnt = 0;
  int _pmCnt = 0;
  int _designCnt = 0;
  int _ectCnt = 0;
  int _total = 0;
  int _term = 3;
  String _title = "";
  String _desc = "";
  String _dateTime = DateFormat("yyyy-MM-dd").format(DateTime.now());
  bool _selectContest = false;
  PickedFile _image = PickedFile("/");

  void _showRegisterDialog(BuildContext context) {
    if (formKey.currentState!.validate() == false) {
      return;
    } else {
      formKey.currentState!.save();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            content: Text("게시글을 등록하실건가요?"),
            actions: [
              FlatButton(
                child: Text("예"),
                onPressed: () {
                  Navigator.of(context).pop();
                  _showLoadingDialog(ctx);
                },
              ),
              FlatButton(
                child: Text("아니오"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _showLoadingDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        );
      },
    );
    await Provider.of<ProjectProvider>(context, listen : false).addProject(_image, _title, _desc, _total, _dateTime, _term);
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  Future<void> _selectDateTime(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus(); // focus 제거
    DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      locale: Locale("ko"),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    setState(() {
      _selectContest = true;
      _dateTime = DateFormat("yyyy-MM-dd").format(newDateTime!);
    });
  }

  void _selectPhoto() async {
    PickedFile? selectedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (selectedImage == null) {
      return;
    }
    setState(() {
      _image = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    _total = _frontCnt +
        _backCnt +
        _aosCnt +
        _iosCnt +
        _pmCnt +
        _designCnt +
        _ectCnt;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "프로젝트 게시글 등록",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              _showRegisterDialog(context);
            },
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleTextComponent("게시글 제목"),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "프로젝트 제목을 입력해주세요.",
                    ),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      _title = value!;
                    },
                    validator: (value) {
                      if (value!.length == 0) {
                        return "필수 입력란입니다.";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  TitleTextComponent("프로젝트 사진"),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: _image.path.length <= 10
                        ? IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _selectPhoto();
                        })
                        : ClipRRect(
                      child: Image.file(
                        File(_image.path),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TitleTextComponent("게시글 내용"),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      maxLength: 200,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "프로젝트에 관한 자세한 설명을 입력해주세요.",
                      ),
                      textInputAction: TextInputAction.newline,
                      onSaved: (value) {
                        _desc = value!;
                      },
                      validator: (value) {
                        if (value!.length == 0) {
                          return "필수 입력란입니다.";
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  TitleTextComponent("프로젝트 기간"),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "프로젝트 제작 기간을 입력해주세요.",
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      _term = int.parse(value!);
                    },
                    validator: (value) {
                      if (int.parse(value!) > 12) {
                        return "필수 입력란입니다.";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  TitleTextComponent("모집 분야별 인원"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text("프론트엔드"),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(
                                      () {
                                        if (_frontCnt > 0) {
                                          _frontCnt--;
                                        }
                                      },
                                    );
                                  },
                                ),
                                Text(_frontCnt.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _frontCnt++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text("백엔드"),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (_backCnt > 0) {
                                        _backCnt--;
                                      }
                                    });
                                  },
                                ),
                                Text(_backCnt.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _backCnt++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text("안드로이드"),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (_aosCnt > 0) {
                                        _aosCnt--;
                                      }
                                    });
                                  },
                                ),
                                Text(_aosCnt.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _aosCnt++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text("IOS"),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (_iosCnt > 0) {
                                        _iosCnt--;
                                      }
                                    });
                                  },
                                ),
                                Text(_iosCnt.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _iosCnt++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text("PM"),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (_pmCnt > 0) {
                                        _pmCnt--;
                                      }
                                    });
                                  },
                                ),
                                Text(_pmCnt.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _pmCnt++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text("디자이너"),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (_designCnt > 0) {
                                        _designCnt--;
                                      }
                                    });
                                  },
                                ),
                                Text(_designCnt.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _designCnt++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text("기타"),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (_ectCnt > 0) {
                                        _ectCnt--;
                                      }
                                    });
                                  },
                                ),
                                Text(_ectCnt.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _ectCnt++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text(""),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Text("총원 ${_total.toString()}명",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TitleTextComponent("모집 종료일"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: _selectContest
                            ? Text(
                                "$_dateTime",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                "날짜 선택하기를 클릭하여\n모집 종료일을 설정해주세요.\n\n현재 날짜 : $_dateTime",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child: FlatButton(
                          child: Text(
                            "날짜\n선택하기",
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            _selectDateTime(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TitleTextComponent("공모전 프로젝트 여부"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: _title.length == 0
                            ? Text(
                                "공모전 프로젝트인 경우 찾아보기를 클릭하여\n해당 공모전을 등록해주세요.",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            : Text(
                                "$_title",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child: FlatButton(
                          child: Text("찾아보기"),
                          onPressed: () async {
                            final title = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContestListPage(),
                              ),
                            );
                            setState(() {
                              _title = title;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget TitleTextComponent(String keyword) {
    return Container(
      child: Text(
        keyword,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}
