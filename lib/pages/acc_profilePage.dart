import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class AccProfilePage extends StatefulWidget {
  const AccProfilePage({Key? key}) : super(key: key);

  @override
  _AccProfilePageState createState() => _AccProfilePageState();
}

class _AccProfilePageState extends State<AccProfilePage> {
  // bool isEnabled = false;

  Widget buildPersonalData() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Личная информация:', style: TextStyle(
            fontFamily: 'Josefin-sans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromRGBO(72, 139, 254, 100),
          ),),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                SizedBox(child: Text('Фамилия:'), width: 80,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 200,
                  child: TextFormField(
                    initialValue: 'Иванов',
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                SizedBox(child: Text('Имя:'),width: 80,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 200,
                  child: TextFormField(
                    initialValue: 'Иван',
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                SizedBox(child: Text('Отчество:'),width: 80,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 200,
                  child: TextFormField(
                    initialValue: 'Иванович',
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
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

  Widget buildGoogleAuth() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => print("Forgot Password pressed"),
          child: Text(
            'Войти через Google',
            style:
            TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
          ),
        ),
        Image.asset('assets/pictures/googleIcon.png'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          child: Row(
                            children: [
                              Text('Профиль', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 24,
                                fontFamily: 'Josefin-sans',
                                fontWeight: FontWeight.bold,
                              ),),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.edit))
                            ],
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(230, 230, 230, 100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                margin: const EdgeInsets.only(left: 20),
                                child: TextFormField(
                                  initialValue: 'Имя пользователя',
                                  minLines: 2,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa'
                                  ),),
                              ),
                              Icon(
                                Icons.account_circle,
                                size: 90,
                                color: Color.fromRGBO(91, 92, 94, 100),)
                            ],
                          ),
                        ),
                      ),
                      buildPersonalData(),
                      // SizedBox(height: 30),
                      // buildEmail(),
                      // SizedBox(height: 20),
                      // buildPassword(),
                      // buildForgotPassBtn(),
                      // // buildRememberCb(),
                      // buildLoginBtn(),
                      // buildGoogleAuth(),
                      // Container(
                      //   margin: const EdgeInsets.only(top: 60),
                      //   child: TextButton(
                      //     onPressed: () {
                      //       Navigator.pushReplacementNamed(context, '/signup');
                      //     },
                      //     child: Text(
                      //       'Регистрация',
                      //       style: TextStyle(
                      //         decoration: TextDecoration.underline,
                      //         fontSize: 18,
                      //         color: Color.fromRGBO(87, 72, 254, 100),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
