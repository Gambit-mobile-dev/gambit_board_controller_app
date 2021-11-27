import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

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
        _date.value = TextEditingValue(text: '${birth_date.day}-${birth_date.month}-${birth_date.year}');
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
                hintStyle: TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
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
                hintStyle: TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
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
                hintStyle: TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
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
                  hintStyle: TextStyle(color: Color.fromRGBO(113, 109, 108, 100)),
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
                hintStyle: TextStyle(color: Color.fromRGBO(113, 109, 108, 100))),
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
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
                              Text('РЕГИСТРАЦИЯ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Yeseva',
                                  )),
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
                              // Container(
                              //   margin: const EdgeInsets.only(top: 60),
                              //   child: TextButton(
                              //     onPressed: () => print("Sign up pressed"),
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
                      )
                  )
                ],
              )),
        ));
  }
}
