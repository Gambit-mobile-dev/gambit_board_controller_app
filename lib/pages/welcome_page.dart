import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambit_board_controller_app/pages/loginScreen.dart';
import "package:lottie/lottie.dart";

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
// Задержка для отображения загрузки, переход на выбранный Pages
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 500,
                width: 500,
                child: Lottie.asset('assets/welcome/3d-chess.json')),
            SizedBox(height: 10),
            Image.asset('assets/pictures/logo.png'),
          ],
        ),
      ),
    );
  }
}
