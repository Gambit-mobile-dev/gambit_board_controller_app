import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreenUserData extends StatefulWidget {
  const SignupScreenUserData({Key? key}) : super(key: key);

  @override
  _SignupScreenUserDataState createState() => _SignupScreenUserDataState();
}

class _SignupScreenUserDataState extends State<SignupScreenUserData> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  Future _selectDate(BuildContext context) async {
    final birth_date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 100));
    if (birth_date != null && birth_date != selectedDate)
      setState(() {
        selectedDate = birth_date;
        _date.value = TextEditingValue(
            text: '${birth_date.day}-${birth_date.month}-${birth_date.year}');
      });
  }

  // late DateTime birth_date;
  //
  // String getDate() {
  //   if (birth_date == null) {
  //     return 'Дата рождения';
  //   }
  //   else {
  //     return '${birth_date.day}.${birth_date.month}.${birth_date.year}';
  //   }
  // }
  //
  // Future pickDate(BuildContext context) async{
  //   final initialDate = DateTime.now();
  //   final newDate = await showDatePicker(
  //       context: context,
  //       initialDate: initialDate,
  //       firstDate: DateTime(DateTime.now().year - 100),
  //       lastDate: DateTime(DateTime.now().year + 100),
  //   );
  //
  //   if (newDate == null) return;
  //
  //   setState(() => birth_date = newDate);
  // }

  Widget buildFIO() {
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
            // textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20),
                border: InputBorder.none,
                hintText: 'ФИО',
                hintStyle:
                    TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
          ),
        )
      ],
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
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            // textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20),
                border: InputBorder.none,
                hintText: 'Email',
                hintStyle:
                    TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
          ),
        )
      ],
    );
  }

  Widget buildNickname() {
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
            // textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20),
                border: InputBorder.none,
                hintText: 'Имя пользователя',
                hintStyle:
                    TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
          ),
        )
      ],
    );
  }

  Widget buildBirthDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
              child: TextFormField(
                controller: _date,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  hintText: 'Дата рождения',
                  hintStyle:
                      TextStyle(color: Color.fromRGBO(113, 109, 108, 100)),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildPhone() {
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
            // textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20),
                border: InputBorder.none,
                hintText: 'Номер телефона',
                hintStyle:
                    TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
          ),
        )
      ],
    );
  }

  Widget buildContinueBtn() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreenUserPassword()));
          },
          child: Text(
            'Продолжить',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('РЕГИСТРАЦИЯ',
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
                          buildFIO(),
                          SizedBox(height: 20),
                          buildEmail(),
                          SizedBox(height: 20),
                          buildNickname(),
                          SizedBox(height: 20),
                          buildBirthDate(context),
                          SizedBox(height: 20),
                          buildPhone(),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/login');
                              },
                              child: Text(
                                'Уже есть аккаунт? Войти',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color.fromRGBO(87, 72, 254, 100),
                                ),
                              ),
                            ),
                          ),
                          buildContinueBtn(),
                        ],
                      ),
                    ),
                  )
              )
            ],
          )),
        ));
  }
}

class SignupScreenUserPassword extends StatefulWidget {
  const SignupScreenUserPassword({Key? key}) : super(key: key);

  @override
  _SignupScreenUserPasswordState createState() =>
      _SignupScreenUserPasswordState();
}

class _SignupScreenUserPasswordState extends State<SignupScreenUserPassword> {

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
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20),
                border: InputBorder.none,
                hintText: 'Пароль',
                hintStyle:
                TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
          ),
        )
      ],
    );
  }

  Widget buildConfirmPassword() {
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
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20),
                border: InputBorder.none,
                hintText: 'Подтвердите пароль',
                hintStyle:
                TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
          ),
        )
      ],
    );
  }

  Widget buildSignupBtn() {
    return Container(
        margin: EdgeInsets.only(top: 15, left: 50, right: 50),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Text(
            'ОК',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text('РЕГИСТРАЦИЯ',
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
                              SizedBox(height: 80),
                              buildPassword(),
                              SizedBox(height: 20),
                              buildConfirmPassword(),
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(context, '/login');
                                  },
                                  child: Text(
                                    'Уже есть аккаунт? Войти',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      color: Color.fromRGBO(87, 72, 254, 100),
                                    ),
                                  ),
                                ),
                              ),
                              buildSignupBtn(),
                            ],
                          ),
                        ),
                      ))
                ],
              )),
        ));
  }
}
