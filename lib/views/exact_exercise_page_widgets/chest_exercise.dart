import 'package:flutter/material.dart';
import 'package:flutter_team_project/models/exercise.dart';

class ChestExercise extends StatefulWidget {
  const ChestExercise({Key? key}) : super(key: key);

  @override
  _ChestExerciseState createState() => _ChestExerciseState();
}

class _ChestExerciseState extends State<ChestExercise> {

  List<Exercise> exerciseList = [
    Exercise(name: 'Прыжки', durationOrRepeat: '00:30'),
    Exercise(name: 'Отжимания с опорой впереди', durationOrRepeat: '6 повтор.'),
    Exercise(name: 'Отжимания от пола', durationOrRepeat: '4 повтор.'),
    Exercise(name: 'Отжимания с широким упором', durationOrRepeat: '4 повтор.'),
    Exercise(name: 'Обратные отжимания от стула', durationOrRepeat: '6 повтор.'),
    Exercise(name: 'Отжимания с широким упором', durationOrRepeat: '4 повтор.'),
    Exercise(name: 'Отжимания с опорой впереди', durationOrRepeat: '4 повтор.'),
    Exercise(name: 'Обратные отжимания от стула', durationOrRepeat: '4 повтор.'),
    Exercise(name: 'Отжимания с упором на колени', durationOrRepeat: '4 повтор.'),
    Exercise(name: 'Растяжка "Кобра"', durationOrRepeat: '00:20'),
    Exercise(name: 'Отжимания от пола', durationOrRepeat: '4 повтор.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildExercises(),
    );
  }

  Widget buildExercises() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: exerciseList.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        final exercise = exerciseList[index];
        return Container(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText(exercise.name!, 19, Colors.black),
              SizedBox(height: 7),
              _buildText(exercise.durationOrRepeat!, 17, Colors.grey[800]!),
            ],
          ),
        );
      },
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