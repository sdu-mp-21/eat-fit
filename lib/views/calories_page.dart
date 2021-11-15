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
          SizedBox(height: 15,),
          _buildText('Таблица колорийности', 20, Colors.black),
          SizedBox(height: 25,),
          calorieCategories('meat', 'dairy', 'Мясо', 'Молочные'),
          SizedBox(height: 20,),
          calorieCategories('cereals', 'vegetables', 'Крупы', 'Овощи'),
          SizedBox(height: 20,),
          calorieCategories('fruits', 'berries', 'Фрукты', 'Ягоды'),
          SizedBox(height: 20,),
          calorieCategories('oil', 'nuts', 'Масла', 'Орехи'),
        ],
      ),
    );
  }

  Widget calorieCategories(String imagePath1, String imagePath2, String category1, String category2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            navigate(context, imagePath1);
          },
          child: Column(
            children: [
              Image.asset(
                'assets/calories_page_pack/$imagePath1.png',
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
              _buildText(category1, 18, Colors.black),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            navigate(context, imagePath2);
          },
          child: Column(
            children: [
              Image.asset(
                'assets/calories_page_pack/$imagePath2.png',
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
              _buildText(category2, 18, Colors.black),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildText(String text, double size, Color color) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
