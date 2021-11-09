import 'package:flutter/material.dart';
import 'package:flutter_team_project/views/diet_page.dart';
import 'package:flutter_team_project/views/recipes_pages.dart';
import 'package:flutter_team_project/views/favorites_page.dart';

import 'views/calories_page.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  int currentPageIndex = 0;

  List<Widget> pages = [
    RecipesPage(),
    FavoritesPage(),
    DietPage(),
    CaloriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPageIndex = 0;
                      });
                    },
                    child: Image.asset(
                      'assets/MenuPack/recipe-book.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  setText('Рецепты', 16, Colors.black),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPageIndex = 1;
                      });
                    },
                    child: Image.asset(
                      'assets/MenuPack/favorite.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  setText('Избранное', 16, Colors.black),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPageIndex = 2;
                      });
                    },
                    child: Image.asset(
                      'assets/MenuPack/plan.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  setText('Рацион', 16, Colors.black),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPageIndex = 3;
                      });
                    },
                    child: Image.asset(
                      'assets/MenuPack/calories.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  setText('Калории', 16, Colors.black),
                ],
              ),
            ],
          ),
          SizedBox(height: 15,),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          pages[currentPageIndex],
        ],
      ),
    );
  }

  Widget setText(String text, double fontSize, Color fontColor) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
