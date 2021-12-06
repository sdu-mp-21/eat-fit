import 'package:flutter/material.dart';
import 'package:flutter_team_project/db/recipes_database.dart';
import 'package:flutter_team_project/views/login_screen.dart';

import '../main_page.dart';
import '../menu_page.dart';
import '../navigation_drawer_widget.dart';
import '../training_page.dart';


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
  void dispose() {
    RecipesDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNavigationBar(),
      appBar: AppBar(
        title: Text('EatFit'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              logout(context);
            }
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
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

  Future<void> logout(BuildContext context) async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}