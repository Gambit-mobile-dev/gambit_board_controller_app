import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'pages/loginScreen.dart';
import 'pages/signupScreen.dart';
import 'pages/homeScreen.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Gambit',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/welcome',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreenUserData(),
        '/welcome': (context) => WelcomePage(),
        '/home': (context) => MainScreen(),
      },
    );
  }
}
