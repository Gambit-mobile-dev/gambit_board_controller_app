import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;

  String signupURL = 'https://lichess.org/signup';
  String loginURL = 'https://lichess.org';

  void _launchLichessURL(String url) async {
    if (!await launch(url, forceWebView: true))
      throw 'Could not launch $url';
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon:
                    Icon(Icons.email, color: Color.fromRGBO(72, 139, 254, 100)),
                hintText: 'Email',
                hintStyle:
                    TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon:
                    Icon(Icons.lock, color: Color.fromRGBO(72, 139, 254, 100)),
                hintText: 'Password',
                hintStyle:
                    TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
          ),
        )
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password pressed"),
        child: Text(
          'Забыли пароль?',
          style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget buildRememberCb() {
    return Container(
        height: 20,
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                },
              ),
            ),
            Text(
              'Запомнить меня',
              style:
                  TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Widget buildLoginBtn() {
    return Container(
        margin: EdgeInsets.only(top: 15, left: 50, right: 50),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Text(
            'Войти',
            style: TextStyle(
              color: Color.fromRGBO(72, 139, 254, 100),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(
                          color: Color.fromRGBO(72, 139, 254, 100),
                          width: 3)))),
        ));
  }

  Widget buildLichessAuth() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => setState(() {
            _launchLichessURL(loginURL);
            Timer(const Duration(seconds: 5), () {closeWebView();});
          }),
          child: Text(
            'Войти через Lichess',
            style:
                TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
          ),
        ),
        Image.asset('assets/pictures/lichessIcon.png', width: 25.0, height: 25.0,),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('АВТОРИЗАЦИЯ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Yeseva',
              )),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(230, 230, 230, 100),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Stack(
            children: <Widget>[
              Center(
                  child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(230, 230, 230, 100),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 14, bottom: 14),
                          child: Image.asset('assets/pictures/logo.png')),
                      SizedBox(height: 30),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      buildForgotPassBtn(),
                      // buildRememberCb(),
                      buildLoginBtn(),
                      buildLichessAuth(),
                      Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: TextButton(
                          onPressed: () {
                            _launchLichessURL(signupURL);
                            Timer(const Duration(seconds: 10), () {closeWebView();});
                          },
                          child: Text(
                            'Регистрация',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color.fromRGBO(87, 72, 254, 100),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          )),
        ));
  }
}
