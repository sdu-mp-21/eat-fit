import 'package:flutter/material.dart';

class DietPage extends StatefulWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/DietPack/breakfast.png',
                    width: 80,
                    height: 80,
                  ),
                  _buildText('Завтрак', 18, Colors.black),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/DietPack/lunch.png',
                    width: 80,
                    height: 80,
                  ),
                  _buildText('Обед', 18, Colors.black),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/DietPack/dinner.png',
                    width: 80,
                    height: 80,
                  ),
                  _buildText('Ужин', 18, Colors.black),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/DietPack/snack.png',
                    width: 80,
                    height: 80,
                  ),
                  _buildText('Перекус', 18, Colors.black),
                ],
              ),
            ],
          ),
        ],
      ),
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
