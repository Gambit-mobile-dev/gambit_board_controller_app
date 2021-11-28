import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signupScreen.dart';
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
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
    });
   
   
   super.initState();
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            width: 500,
            child: Lottie.asset('assets/welcome/chess.json')),
            SizedBox(height: 10),
          Text("Gambit",
              style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold),

          ),
        ],
      ),),
    );
  }
}