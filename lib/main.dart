import 'package:flutter/material.dart';
import 'loginScreen.dart';
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
        home: LoginScreen());

  }
}