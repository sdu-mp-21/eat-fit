import 'package:flutter/material.dart';
import 'package:flutter_team_project/views/calories_info_dart.dart';


class CaloriesPage extends StatefulWidget {
  const CaloriesPage({Key? key}) : super(key: key);

  @override
  _CaloriesPageState createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {

  void navigate(BuildContext context, String category) {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => CaloriesInfo(text: category)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text(
            'Таблица калорийности',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 30,),
          calorieCategories('meat', 'dairy'),
          SizedBox(height: 30,),
          calorieCategories('cereals', 'vegetables'),
          SizedBox(height: 30,),
          calorieCategories('fruits', 'berries'),
        ],
      ),
    );
  }

  Widget calorieCategories(String category1, String category2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            navigate(context, category1);
          },
          child: Image.asset(
            'assets/calories_page_pack/$category1.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        GestureDetector(
          onTap: () {
            navigate(context, category2);
          },
          child: Image.asset(
            'assets/calories_page_pack/$category2.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
      ],
    );
  }
}