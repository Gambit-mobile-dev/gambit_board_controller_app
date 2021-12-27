/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
import 'package:gambit_board_controller_app/classes/User.dart';
import 'package:gambit_board_controller_app/classes/ScreenArguments.dart';
import 'package:gambit_board_controller_app/pages/gamePage.dart';
import 'paramsofgamePage.dart';
import 'acc_profilePage.dart';
import 'devicesPage.dart';
import 'package:flutter/material.dart';


/// This is the stateful widget that the main application instantiates.
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  String appbarTitle = 'GAME';

  static List<Widget> _widgetOptions = <Widget>[
    GamePage(),
    DevicesPage(),
    AccProfilePage()
  ];
  void _onItemTapped(int index) {
    setState(()
    {
      _selectedIndex = index;
      if (index == 0) appbarTitle = 'GAME';
      else if (index == 1) appbarTitle = 'DEVICES';
      else if (index == 2) appbarTitle = 'ACCOUNT PROFILE';
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments screenArguments = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(appbarTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'Yeseva',
            )),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(230, 230, 230, 100),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      body: new Stack(
        children: [
          new Offstage(
            offstage: _selectedIndex != 0,
            child: new TickerMode(
                enabled: _selectedIndex == 0,
                child: new GamePage()),
          ),
          new Offstage(
            offstage: _selectedIndex != 1,
            child: new TickerMode(
                enabled: _selectedIndex == 1,
                child: new DevicesPage()),
          ),
          new Offstage(
            offstage: _selectedIndex != 2,
            child: new TickerMode(
                enabled: _selectedIndex == 2,
                child: new AccProfilePage()),
          ),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Game',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(72, 139, 254, 100),
        onTap: _onItemTapped,
      ),
    );
  }
}



//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.groups),
//             label: 'Game',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.devices),
//             label: 'Devices',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'Account',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color.fromRGBO(72, 139, 254, 100),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
