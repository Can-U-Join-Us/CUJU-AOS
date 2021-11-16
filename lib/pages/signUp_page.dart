import 'package:flutter/material.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "/signUp";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  Future<void> _submit() async {
    if (formKey.currentState!.validate() == false) {
      return;
    } else {
      formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("가입이 완료되었습니다. 로그인을 진행해주세요."),
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.of(context).pop();
    }
  }

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
                TextFormFieldComponent(false, TextInputType.name,
                    TextInputAction.next, "이름을 입력해주세요.", 2, "이름은 2자 이상입니다."),
                SizedBox(height: 20),
                TitleTextComponent("휴대폰 번호"),
                TextFormFieldComponent(false, TextInputType.number,
                    TextInputAction.next, "(예시) 01012341234", 10, "휴대폰 번호는 10자 이상입니다."),
                SizedBox(height: 20),
                TitleTextComponent("계정 이메일"),
                TextFormFieldComponent(false, TextInputType.emailAddress,
                    TextInputAction.next, "계정 이메일을 입력해주세요.", 10, "이메일 형식에 맞게 입력해주세요."),
                SizedBox(height: 20),
                TitleTextComponent("비밀번호"),
                Container(
                  child: Text(
                    "영문, 숫자, 특수문자를 1개 이상 조합하여 10자리 이상을 입력해주세요.",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                TextFormFieldComponent(true, TextInputType.visiblePassword,
                    TextInputAction.done, "비밀번호를 입력해주세요.", 10, "비밀번호는 10자 이상입니다."),
                SizedBox(height: 20),
                TitleTextComponent("비밀번호 확인"),
                TextFormFieldComponent(true, TextInputType.visiblePassword,
                    TextInputAction.next, "비밀번호를 다시 한번 해주세요.", 10, "비밀번호는 10자 이상입니다."),
                SizedBox(height: 20),
                CheckBoxComponent("개인정보 수집 및 이용 동의 (필수)"),
                SizedBox(height: 20),
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
                    _submit();
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
      margin: EdgeInsets.only(bottom: 10),
    );
  }

  Widget TextFormFieldComponent(bool obscureText, TextInputType keyboardType,
      TextInputAction textInputAction, String hintText, int maxSize, String errorMessage) {
    return Container(
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        validator: (value) {
          if (value!.length < maxSize) {
            return errorMessage;
          }
        },
      ),
    );
  }

  Widget CheckBoxComponent(String keyword) {
    return CheckboxListTileFormField(
      validator: (value) {
        if (value == false) {
          return "필수 동의 항목입니다.";
        } else {
          return null;
        }
      },
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
