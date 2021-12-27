import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:gambit_board_controller_app/api/LichessAPI.dart';
import 'package:gambit_board_controller_app/classes/ScreenArguments.dart';


class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

enum FigureColor {white, black}

class _GamePageState extends State<GamePage> {


  FigureColor? figureColor = FigureColor.white;
  double currentvalue = 1.0;

  ChessBoardController controller = ChessBoardController();

  LichessAPI lichess = new LichessAPI();
  var gameId;

  void AIgameController(String token, var level, var color) async {
    lichess.accessToken = token;
    var gameData = await lichess.startGameAI(level, "", "", "1", color, "standard");
    gameId = gameData['id'];
    print(gameId);
    var stream = await lichess.listenStreamGameState(gameId);
    await for (var str in stream) {
      switch (str['type']) {
        case 'gameFull':
          print(str['state']['moves']);
          break;
        case 'gameState' :
          print(str['moves']);
          break;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final ScreenArguments screenArguments = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    String token = screenArguments.token;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChessBoard(
                  controller: controller,
                  boardOrientation: PlayerColor.white,
                  onMove: () {
                    String move = controller.value.history.last.move.fromAlgebraic + controller.value.history.last.move.toAlgebraic;
                    // print(controller.value.history.last.move.fromAlgebraic);
                    // print(controller.value.history.last.move.toAlgebraic);
                    lichess.makeMove(gameId, move);
                  },
                ),
                SizedBox(
                  width: 220,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, builder: (BuildContext context) {
                        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                          return SimpleDialog(
                            title: const Text('Параметры игры'),
                            children: <Widget>[
                              SimpleDialogOption(
                                onPressed: () {},
                                child: const Text('Уровень сложности:'),
                              ),
                              SimpleDialogOption(
                                onPressed: () {},
                                child: Slider(
                                  value: currentvalue,
                                  min: 1,
                                  max: 8,
                                  divisions: 7,
                                  label: currentvalue.toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      currentvalue = value;
                                    });
                                  },
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () {},
                                child: const Text('Выберите цвет:'),
                              ),
                              SimpleDialogOption(
                                onPressed: () {},
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Text('Белые'),
                                      leading: Radio<FigureColor>(
                                          value: FigureColor.white,
                                          groupValue: figureColor,
                                          onChanged:(FigureColor? value){
                                            setState(() {
                                              figureColor = value;
                                            });
                                          },),
                                    ),
                                    ListTile(
                                      title: Text('Черные'),
                                      leading: Radio<FigureColor>(
                                        value: FigureColor.black,
                                        groupValue: figureColor,
                                        onChanged:(FigureColor? value){
                                          setState(() {
                                            figureColor = value;
                                          });
                                        },),
                                    ),
                                  ],
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () {},
                                child: ElevatedButton(
                                  child: Text('Начать'),
                                  onPressed: (){
                                    AIgameController(token, currentvalue.toInt().toString(), figureColor.toString().split('.').last);
                                  },
                                )
                              ),
                            ],
                          );
                        });
                      });

                    },
                    child: Text('Играть с компьютером', style: TextStyle(
                      fontSize: 15
                    ),),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Colors.lightBlue,
                            )
                          )
                      ),
                    ),),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 220,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('Играть с человеком', style: TextStyle(
                        fontSize: 15
                    ),),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Colors.lightBlue,
                              )
                          )
                      ),
                    ),),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 220,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('Обучение', style: TextStyle(
                        fontSize: 15
                    ),),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Colors.lightBlue,
                              )
                          )
                      ),
                    ),),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

