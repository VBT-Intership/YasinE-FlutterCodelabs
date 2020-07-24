import 'package:flutter/material.dart';
import 'package:mdc101/screens/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: buildLoginLView(context),
      ),
    );
  }

  ListView buildLoginLView(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          SizedBox(height: 80.0),
          Column(
            children: [
              Image.asset("assets/diamond.png"),
              SizedBox(height: 16.0),
              Text("SHRINE"),
            ],
          ),
          SizedBox(height: 120.0),
          TextField(
            controller: _controllerUserName,
            decoration: InputDecoration(
              filled: true,
              labelText: "Kullanıcı Adı",
            ),
            maxLines: 1,
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: _controllerPassword,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              labelText: "Şifre",
            ),
          ),
          buildButtonBar(context)
        ],
      );
  }

  ButtonBar buildButtonBar(BuildContext context) {
    return ButtonBar(
            children: [
              FlatButton(
                  onPressed: () {
                    _controllerUserName.clear();
                    _controllerPassword.clear();
                  },
                  child: Text("CANCEL")),
              RaisedButton(
                  onPressed: () {
                    _controllerPassword.clear();
                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );*/
                    Navigator.pop(context);
                  },
                  child: Text("NEXT")),
            ],
          );
  }
}
