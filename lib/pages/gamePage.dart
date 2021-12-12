import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
ChessBoardController controller = ChessBoardController();

  List<Device> devices = <Device>[
    Device(1, 'Модель №1', 'Подключить'),
    Device(2, 'Модель №2', 'Подключить'),
    Device(3, 'Модель №3', 'Подключить'),
    Device(4, 'Модель №4', 'Подключить')
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Container(
                child: ChessBoard(
                  controller: controller,
                boardOrientation: PlayerColor.white,
              ),
          ),
                ),
              ),
        );
  }
}

class Device {
  final int id;
  final String nameModel;
  String isConnected;
  Device(this.id, this.nameModel, this.isConnected);
}