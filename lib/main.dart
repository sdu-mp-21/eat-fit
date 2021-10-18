import 'package:flutter/material.dart';
import 'lockscreen.dart';
import 'NavigationDrawerWidget.dart';
import 'TrainingPage.dart';
import 'MenuPage.dart';
import 'MainPage.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Home(),
    '/lock': (context) => const LockScreen(),
    '/training': (context) => const TrainingPage(),
    '/menu': (context) => const MenuPage(),
  },
  debugShowCheckedModeBanner: false,
));


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  List<Widget> pages = [
    TrainingPage(),
    MainPage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNavigationBar(),
      appBar: AppBar(
        title: Text('Eat and Fit'),
        backgroundColor: Color.fromRGBO(39, 16, 51, 1),
        centerTitle: true,
      ),
      body: Center(
        child: pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance,
            ),
            title: Text('Training'),
            backgroundColor: Colors.purple[500],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money,
            ),
            title: Text('Main'),
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_rounded,
            ),
            title: Text('Menu'),
            backgroundColor: Colors.deepOrange,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

