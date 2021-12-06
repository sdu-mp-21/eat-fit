import 'package:flutter/material.dart';
import 'package:flutter_team_project/views/about_page.dart';
import 'package:flutter_team_project/views/add_recipe.dart';
import 'package:flutter_team_project/views/exercise_page.dart';
import 'package:flutter_team_project/views/home.dart';
import 'db/recipes_database.dart';
import 'navigation_drawer_widget.dart';
import 'training_page.dart';
import 'menu_page.dart';
import 'main_page.dart';
import 'profile_page.dart';
import 'edit_profile_page.dart';
import 'views/calories_info_dart.dart';
import 'views/login_screen.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const LoginScreen(),
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
));

