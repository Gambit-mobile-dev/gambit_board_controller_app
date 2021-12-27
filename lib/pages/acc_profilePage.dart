import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:gambit_board_controller_app/classes/User.dart';
import 'package:gambit_board_controller_app/classes/ScreenArguments.dart';
import 'package:gambit_board_controller_app/pages/homeScreen.dart';

class AccProfilePage extends StatefulWidget {
  const AccProfilePage({Key? key}) : super(key: key);


  @override
  _AccProfilePageState createState() => _AccProfilePageState();
}


class _AccProfilePageState extends State<AccProfilePage> {

  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  Widget buildPersonalData(User user) {
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
                  width: 250,
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    initialValue: user.lastname,
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
                  width: 250,
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    initialValue: user.firstname,
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
                    'Email:',
                    style: TextStyle(fontSize: 18),
                  ),
                  width: 100,
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 250,
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    initialValue: user.email,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
        ]));
  }

  Widget buildGameStat(User user) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text(
            'Сыгранных партий - ' + user.allgames.toString(),
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
                  'Побед - ' + user.wins.toString(),
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Поражений - ' + user.loses.toString(),
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
                    flex: user.wins.isInfinite?5:user.wins,
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
                    flex: user.wins.isInfinite?5:user.loses,
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
    final ScreenArguments screenArguments = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    User user = screenArguments.user;
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
                              initialValue: user.username,
                              minLines: 1,
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
                  buildPersonalData(user),
                  SizedBox(
                    height: 10,
                  ),
                  buildGameStat(user),
              ],
          ),
        ),
      )),
    ));
  }
}
