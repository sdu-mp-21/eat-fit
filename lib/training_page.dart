import 'package:flutter/material.dart';
import 'package:flutter_team_project/views/exercise_page.dart';


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
        _buildText('Тренировки на группы мышц:', 22, Colors.black),
        trainingPageItemsBuilder('assets/exercise_pack/abs', 'Пресс', 'assets/exercise_pack/chest', 'Грудь'),
        trainingPageItemsBuilder('assets/exercise_pack/leg', 'Ноги', 'assets/exercise_pack/arm', 'Руки'),
        trainingPageItemsBuilder('assets/exercise_pack/shoulder', 'Плечи', 'assets/exercise_pack/back', 'Спина'),
      ],
    );
  }

  Widget trainingPageItemsBuilder(String imagePath1, String exerciseName1, String imagePath2, String exerciseName2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => ExercisePage(text: exerciseName1)
              ),
            );
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
            Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => ExercisePage(text: exerciseName2)
              ),
            );
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
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
