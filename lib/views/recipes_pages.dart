import 'package:flutter/material.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          _buildMenuItem('salat-na-uzhin', 'Легкий пп салат на ужин', 20, Colors.black, 'Яичные белки, Огурец, Творог нежирный, Йогурт греческий, Масло оливковое', '10', 16),
          _buildMenuItem('rybnyie-kotliety', 'Рыбные котлеты из лосося и трески', 20, Colors.black, 'Фарш трески, Фарш лосося, Яйца, Средняя луковица, Мука, Зелень', '50', 16),
          _buildMenuItem('obied', 'Филе с грибами', 20, Colors.black, 'Филе индейки, Шампиньоны, Сливки , Сыр моцарелла, Свежий шпинат, Яичные гнезда', '30', 16),
          _buildMenuItem('makaroshki-s-kurochkoi', 'Простые макарошки с курочкой и грибами', 20, Colors.black, 'Макароны сухие, Куриное филе, Шампиньоны, Сливочное масло, Сливки, Сыр', '60', 16),
          _buildMenuItem('blinchiki-s-tvoroghom', 'Блинчики с творогом и джемом', 20, Colors.black, 'Яйцо, Молоко, Творог нежирный, Мука рисовая, Масло растительное, Джем', '20', 16),
          _buildMenuItem('tort', 'Торт из хлебцев', 20, Colors.black, 'Хлебцы, Молоко, Творог, Банан, Грецкий орех, Какао, Сахарозаменитель', '10', 16),
        ],
      ),
    );
  }

  Widget _buildText(String text, double size, Color textColor) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: size,
        color: textColor,
      ),
    );
  }

  Widget _buildMenuItem(String imageName, String mealName, double nameSize, Color textColor, String ingredients, String time, double timeSize) {
    return Row(
      children: [
        Image.asset(
          'assets/RecipePagePack/$imageName.png',
          width: 100,
          height: 100,
        ),
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText(mealName, nameSize, Colors.black),
            SizedBox(height: 7,),
            _buildText(ingredients, 14, Colors.grey),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.timer_rounded,
                  size: timeSize,
                ),
                SizedBox(width: 5),
                _buildText('$time мин', timeSize, Colors.black),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
