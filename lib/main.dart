import 'package:flutter/material.dart';
import 'package:flutter_team_project/views/about_page.dart';
import 'package:flutter_team_project/views/add_recipe.dart';
import 'package:flutter_team_project/views/exercise_page.dart';
import 'views/lockscreen.dart';
import 'navigation_drawer_widget.dart';
import 'training_page.dart';
import 'menu_page.dart';
import 'main_page.dart';
import 'profile_page.dart';
import 'edit_profile_page.dart';
import 'views/calories_info_dart.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Home(),
    '/lock': (context) => const LockScreen(),
    '/training': (context) => const TrainingPage(),
    '/menu': (context) => const MenuPage(),
    '/profile': (context) => const ProfilePage(),
    '/edit_profile_page': (context) => const EditProfilePage(),
    '/calories_info_page': (context) => const CaloriesInfo(),
    '/exercise_page': (context) => const ExercisePage(),
    '/add_recipe': (context) => const AddRecipe(),
    '/about_page': (context) => const AboutPage(),
  },
  debugShowCheckedModeBanner: false,
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
        title: Text('EatFit'),
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

