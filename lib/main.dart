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
  themeMode: ThemeMode.system,
));


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;

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
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sports,
            ),
            title: Text('Тренировка'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.accessibility_new,
            ),
            title: Text('Главная'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
            ),
            title: Text('Питание'),
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

