import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class TrainingPage extends StatefulWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        trainingPageItemsBuilder('assets/exercise_pack/run', 'Бег', 'assets/exercise_pack/cycling', 'Езда'),
        trainingPageItemsBuilder('assets/exercise_pack/push_up', 'Отжимание', 'assets/exercise_pack/sit_up', 'Скручивания'),
        trainingPageItemsBuilder('assets/exercise_pack/squat', 'Приседание', 'assets/exercise_pack/walk', 'Ходьба'),
      ],
    );
  }

  Widget trainingPageItemsBuilder(String imagePath1, String exerciseName1, String imagePath2, String exerciseName2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/exercise_page');
          },
          child: Column(
            children: [
              Image.asset(
                '$imagePath1.png',
                width: 80,
                height: 80,
              ),
              SizedBox(height: 15),
              _buildText(exerciseName1, 20, Colors.black),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/exercise_page');
          },
          child: Column(
            children: [
              Image.asset(
                '$imagePath2.png',
                width: 80,
                height: 80,
              ),
              SizedBox(height: 15),
              _buildText(exerciseName2, 20, Colors.black),
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
