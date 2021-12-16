import 'package:canyoujoinus/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  static const routeName = "/changePassword";

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final formKey = GlobalKey<FormState>();
  late String _currentPassword;
  late String _changePassword;
  var _isLoading = false;

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "비밀번호 변경 실패",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text("입력한 현재 비밀번호를 확인해주세요."),
        actions: <Widget>[
          FlatButton(
            child: Text("예"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (formKey.currentState!.validate() == false) {
      return;
    } else {
      formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<AuthProvider>(context, listen: false)
            .changePassword(_currentPassword, _changePassword);
      } catch (error) {
        _showErrorDialog();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "비밀번호 변경",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.8,
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "현재 비밀번호를 입력해주세요.",
                  ),
                  onSaved: (value) {
                    _currentPassword = value!;
                  },
                  validator: (value) {
                    if (value!.length < 10) {
                      return "비밀번호는 10자 이상입니다.";
                    }
                  },
                ),
                SizedBox(height: 10),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "변경할 비밀번호를 입력해주세요.",
                    ),
                    onSaved: (value) {
                      _changePassword = value!;
                    },
                    validator: (value) {
                      if (value!.length < 10) {
                        return "비밀번호는 10자 이상입니다.";
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                FlatButton(
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Text("확인",
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
}
