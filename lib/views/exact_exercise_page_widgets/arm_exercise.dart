import 'package:flutter/material.dart';
import 'package:flutter_team_project/models/exercise.dart';

class ArmExercise extends StatefulWidget {
  const ArmExercise({Key? key}) : super(key: key);

  @override
  _ArmExerciseState createState() => _ArmExerciseState();
}

class _ArmExerciseState extends State<ArmExercise> {

  List<Exercise> exerciseList = [
    Exercise(name: 'Вращение руками', durationOrRepeat: '30 повтор.'),
    Exercise(name: 'Подъем рук в сторону', durationOrRepeat: '30 повтор.'),
    Exercise(name: 'Обратные отжимания от стула', durationOrRepeat: '10 повтор.'),
    Exercise(name: 'Махи руками по часовой стрелке', durationOrRepeat: '00:30'),
    Exercise(name: 'Махи руками против часовой стрелки', durationOrRepeat: '00:30'),
    Exercise(name: 'Отжимания со сведенными ладонями', durationOrRepeat: '6 повтор.'),
    Exercise(name: 'Прыжки', durationOrRepeat: '00:30'),
    Exercise(name: 'Движения вверх-вниз сведенными локтями', durationOrRepeat: '00:16'),
    Exercise(name: 'Подъем ноги бицепсом правой руки', durationOrRepeat: '8 повтор.'),
    Exercise(name: 'Подъем ноги бицепсом левой руки', durationOrRepeat: '8 повтор.'),
    Exercise(name: 'Диагональная планка', durationOrRepeat: '10 повтор.'),
    Exercise(name: 'Бой с тенью', durationOrRepeat: '00:30'),
    Exercise(name: 'Отжимания от пола', durationOrRepeat: '10 повтор.'),
    Exercise(name: 'Гусеница', durationOrRepeat: '8 повтор.'),
    Exercise(name: 'Отжимания от стены', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Растяжка левого трицепса', durationOrRepeat: '00:30'),
    Exercise(name: 'Растяжка правого трицепса', durationOrRepeat: '00:30'),
    Exercise(name: 'Растяжка левого бицепса', durationOrRepeat: '00:30'),
    Exercise(name: 'Растяжка правого бицепса', durationOrRepeat: '00:30'),
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
