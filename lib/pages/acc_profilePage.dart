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
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  Future _selectDate(BuildContext context) async {
    final birth_date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year - 150),
        lastDate: DateTime(DateTime.now().year + 1));
    if (birth_date != null && birth_date != selectedDate)
      setState(() {
        selectedDate = birth_date;
        _date.value = TextEditingValue(
            text: '${birth_date.day}-${birth_date.month}-${birth_date.year}');
      });
  }

  Widget buildPersonalData() {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text(
            'Личная информация:',
            style: TextStyle(
              fontFamily: 'Josefin-sans',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromRGBO(72, 139, 254, 100),
            ),
          ),
          Container(
            // margin: const EdgeInsets.symmetric(vertical: 1),
            child: Row(
              children: [
                SizedBox(
                  child: Text(
                    'Фамилия:',
                    style: TextStyle(fontSize: 18),
                  ),
                  width: 100,
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 200,
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
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
            // margin: const EdgeInsets.symmetric(vertical: 1),
            child: Row(
              children: [
                SizedBox(
                  child: Text(
                    'Имя:',
                    style: TextStyle(fontSize: 18),
                  ),
                  width: 100,
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 200,
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
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
            // margin: const EdgeInsets.symmetric(vertical: 1),
            child: Row(
              children: [
                SizedBox(
                  child: Text(
                    'Отчество:',
                    style: TextStyle(fontSize: 18),
                  ),
                  width: 100,
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 200,
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    initialValue: 'Иванович',
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  child: Text(
                    'Дата рождения:',
                    style: TextStyle(fontSize: 18),
                  ),
                  width: 100,
                ),
                Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 200,
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          style: TextStyle(fontSize: 18),
                          // initialValue: '',
                          controller: _date,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ]));
  }

  Widget buildGameStat() {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text(
            'Сыгранных партий - 100',
            style: TextStyle(
              fontFamily: 'Josefin-sans',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromRGBO(72, 139, 254, 100),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Побед - 50',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Поражений - 50',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.5,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.green,
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.5,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.red,
                      ),
                    )),
              ],
            ),
          )
        ]));
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
                                  fontFamily: 'Comfortaa'),
                            ),
                          ),
                          Icon(
                            Icons.account_circle,
                            size: 90,
                            color: Color.fromRGBO(91, 92, 94, 100),
                          )
                        ],
                      ),
                    ),
                  ),
                  buildPersonalData(),
                  SizedBox(
                    height: 10,
                  ),
                  buildGameStat(),
              ],
          ),
        ),
      )),
    ));
  }
}
