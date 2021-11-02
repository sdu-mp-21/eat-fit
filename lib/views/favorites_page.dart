import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setFavoriteMenuItem('oladushki', 'Творожные оладушки', 20, Colors.black, '10', 16),
            setFavoriteMenuItem('pirog', 'Картофельный пирог с яйцом', 20, Colors.black, '40', 16),
            setFavoriteMenuItem('bulghur', 'Булгур с курочкой', 20, Colors.black, '55', 16),
          ],
        ),
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
  
  Widget setFavoriteMenuItem(String imageName, String mealName, double nameSize, Color textColor, String time, double timeSize) {
    return Row(
      children: [
        Image.asset(
          'assets/$imageName.png',
          width: 80,
          height: 80,
        ),
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setText(mealName, nameSize, textColor),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(
                  Icons.timer_rounded,
                  size: timeSize,
                ),
                setText('$time мин', timeSize, textColor),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
