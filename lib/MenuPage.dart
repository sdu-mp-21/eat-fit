import 'package:flutter/material.dart';
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
    CaloriesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentPageIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.book_outlined,
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    'Рецепты',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentPageIndex = 1;
                      });
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    'Избранное',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentPageIndex = 2;
                      });
                    },
                    icon: Icon(
                      Icons.table_view_sharp,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    'Калорий',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
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
}
