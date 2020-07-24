import 'package:flutter/material.dart';
import 'package:mdc101/colors.dart';
import 'package:mdc101/screens/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _unfocusedColor = Colors.green;
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _usernameFocusNode.addListener(() {
      setState(() {});
    });

    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

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
            Image.asset("assets/diamond.png", color: kShrineBlack,),
            SizedBox(height: 16.0),
            Text(
              "SHRINE",
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
        SizedBox(height: 120.0),
        TextField(
          controller: _controllerUserName,
          focusNode: _usernameFocusNode,
          decoration: InputDecoration(
            //filled: true,
            labelText: "Kullanıcı Adı",
            labelStyle: TextStyle(
                color: _usernameFocusNode.hasFocus
                    ? Theme.of(context).accentColor
                    : _unfocusedColor),
          ),
          maxLines: 1,
        ),
        SizedBox(height: 12.0),
        TextField(
          controller: _controllerPassword,
          obscureText: true,
          decoration: InputDecoration(
            //  filled: true,
            labelText: "Şifre",
            labelStyle: TextStyle(
                color: _passwordFocusNode.hasFocus
                    ? Theme.of(context).accentColor
                    : _unfocusedColor),
          ),
          focusNode: _passwordFocusNode,
        ),
        buildButtonBar(context)
      ],
    );
  }

  ButtonBar buildButtonBar(BuildContext context) {
    return ButtonBar(
      children: [
        FlatButton(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            onPressed: () {
              _controllerUserName.clear();
              _controllerPassword.clear();
            },
            child: Text("CANCEL")),
        RaisedButton(
            elevation: 8.0,
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
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            child: Text("NEXT")),
      ],
    );
  }
}
