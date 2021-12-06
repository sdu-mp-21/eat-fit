import 'package:flutter/material.dart';
import 'package:flutter_team_project/models/exercise.dart';

class LegExercise extends StatefulWidget {
  const LegExercise({Key? key}) : super(key: key);

  @override
  _LegExerciseState createState() => _LegExerciseState();
}

class _LegExerciseState extends State<LegExercise> {

  List<Exercise> exerciseList = [
    Exercise(name: 'Прыжки в стороны', durationOrRepeat: '00:30'),
    Exercise(name: 'Приседания', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Приседания', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Подъем ноги лежа на боку (левой)', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Подъем ноги лежа на боку (правой)', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Подъем ноги лежа на боку (левой)', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Подъем ноги лежа на боку (правой)', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Выпады назад', durationOrRepeat: '14 повтор.'),
    Exercise(name: 'Выпады назад', durationOrRepeat: '14 повтор.'),
    Exercise(name: 'Ослик лягается вправо', durationOrRepeat: '16 повтор.'),
    Exercise(name: 'Ослик лягается влево', durationOrRepeat: '16 повтор.'),
    Exercise(name: 'Ослик лягается вправо', durationOrRepeat: '16 повтор.'),
    Exercise(name: 'Ослик лягается влево', durationOrRepeat: '16 повтор.'),
    Exercise(name: 'Растяжка четырехглавой мышцы у стены (левая нога)', durationOrRepeat: '00:30'),
    Exercise(name: 'Растяжка четырехглавой мышцы у стены (правая нога)', durationOrRepeat: '00:30'),
    Exercise(name: 'Растяжка левое колено к груди', durationOrRepeat: '00:30'),
    Exercise(name: 'Растяжка правое колено к груди', durationOrRepeat: '00:30'),
    Exercise(name: 'Подъемы на носки у стены', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Подъемы на носки у стены', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Сумо-Подъемы на носки у стены', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Сумо-Подъемы на носки у стены', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Растяжка левой икры', durationOrRepeat: '00:30'),
    Exercise(name: 'Растяжка правой икры', durationOrRepeat: '00:30'),
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
