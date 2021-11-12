import 'package:flutter/material.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "/signUp";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "회원가입",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleTextComponent("이름"),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "이름을 입력해주세요.",
                  ),
                ),
                SizedBox(height: 25),
                TitleTextComponent("휴대폰 번호"),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "(예시) 01012341234",
                  ),
                ),
                SizedBox(height: 25),
                TitleTextComponent("계정 이메일"),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "계정 이메일을 입력해주세요.",
                  ),
                ),
                SizedBox(height: 25),
                TitleTextComponent("비밀번호"),
                Container(
                  child: Text(
                    "영문, 숫자, 특수문자를 1개 이상 조합하여 10자리 이상을 입력해주세요.",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  margin: EdgeInsets.only(bottom: 5),
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "비밀번호를 입력해주세요.",
                  ),
                ),
                SizedBox(height: 25),
                TitleTextComponent("비밀번호 확인"),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "비밀번호를 다시 한번 입력해주세요.",
                  ),
                ),
                SizedBox(height: 25),
                CheckBoxComponent("개인정보 수집 및 이용 동의 (필수)"),
                CheckBoxComponent("이벤트 소식 등 알림 정보 받기"),
                SizedBox(height: 25),
                FlatButton(
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Text("가입하기",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("가입이 완료되었습니다. 로그인을 진행해주세요."),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
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
      margin: EdgeInsets.only(bottom: 5),
    );
  }

  Widget CheckBoxComponent(String keyword) {
    return CheckboxListTileFormField(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            keyword,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          FlatButton(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.grey),
              child: Text(
                "자세히",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
