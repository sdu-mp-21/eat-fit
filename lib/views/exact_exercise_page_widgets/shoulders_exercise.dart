import 'package:flutter/material.dart';
import 'package:flutter_team_project/models/exercise.dart';

class ShouldersExercise extends StatefulWidget {
  const ShouldersExercise({Key? key}) : super(key: key);

  @override
  _ShouldersExerciseState createState() => _ShouldersExerciseState();
}

class _ShouldersExerciseState extends State<ShouldersExercise> {

  List<Exercise> exerciseList = [
    Exercise(name: 'Прыжки', durationOrRepeat: '00:30'),
    Exercise(name: 'Вращение руками', durationOrRepeat: '16 повтор.'),
    Exercise(name: 'Подъем рук в сторону', durationOrRepeat: '16 повтор.'),
    Exercise(name: 'Отжимания с упором на колени', durationOrRepeat: '14 повтор.'),
    Exercise(name: 'Ножницы руками', durationOrRepeat: '00:30'),
    Exercise(name: 'Отжимания с упором на колени', durationOrRepeat: '14 повтор.'),
    Exercise(name: 'Подъем рук в сторону', durationOrRepeat: '16 повтор.'),
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
