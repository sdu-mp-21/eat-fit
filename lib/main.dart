import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_team_project/views/about_page.dart';
import 'package:flutter_team_project/views/add_recipe.dart';
import 'package:flutter_team_project/views/exercise_page.dart';
import 'package:flutter_team_project/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboard/on_board.dart';
import 'training_page.dart';
import 'menu_page.dart';
import 'profile_page.dart';
import 'edit_profile_page.dart';
import 'views/calories_info_dart.dart';
import 'views/login_screen.dart';

int? isViewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isViewed != 0 ? OnBoard() : LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const Home(),
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
    );
  }
}


