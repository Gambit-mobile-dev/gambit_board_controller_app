import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({Key? key}) : super(key: key);

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {

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
                // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: double.infinity,
                height: double.infinity,
                child: Scrollbar(
                  child: ListView(
                    children: List.generate(devices.length, (index) {
                      return Container(
                              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(230, 230, 230, 100),),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Icon(
                                      Icons.crop_original,
                                      size: 150,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            devices[index].nameModel,
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                if(devices[index].isConnected == 'Подключить') {
                                                  devices[index].isConnected = 'Подключено';
                                                }
                                                else {
                                                  devices[index].isConnected = 'Подключить';
                                                }
                                              });
                                            },
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(100),
                                                        side: BorderSide(
                                                            color: Color.fromRGBO(72, 139, 254, 100),
                                                            width: 3)))),
                                            child: Text(devices[index].isConnected, style: TextStyle(fontSize: 18)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.settings),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                    }),
                  )
                )
      )),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        showDialog(context: context, builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Добавить устройство'),
            children: [
              SimpleDialogOption(
                child: TextButton(
                  child: Text('Модель №5'),
                  onPressed: () {
                    setState(() {
                      devices.add(Device(5, 'Модель №5', 'Подключить'));
                    });
                  },
                ),
              ),
              SimpleDialogOption(
                child: TextButton(
                  child: Text('Модель №6'),
                  onPressed: () {
                    setState(() {
                      devices.add(Device(6, 'Модель №6', 'Подключить'));
                    });
                  },
                ),
              )
            ]
              // color: Colors.white,
              // margin: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
              // width: double.infinity,
              // height: double.infinity,
              // child: Text('bf'),
          );
        });

      },
      // onPressed: (){setState(() {
      //   devices.add(Device(5, 'fd', 'Подключить'));
      // });},
      child: Icon(Icons.add_box),
    ),);
  }
}

class Device {
  final int id;
  final String nameModel;
  String isConnected;
  Device(this.id, this.nameModel, this.isConnected);
}