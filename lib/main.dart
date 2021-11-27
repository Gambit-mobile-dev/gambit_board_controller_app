import 'package:flutter/material.dart';
import 'package:gambit_board_controller_app/pages/signupScreen.dart';
import 'pages/loginScreen.dart';
import 'pages/signupScreen.dart';
void main() {
  runApp(const MyApp());
}


/*MyApp*/



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gambit',
        debugShowCheckedModeBanner:false,
        home: SignupScreen());

  }
}