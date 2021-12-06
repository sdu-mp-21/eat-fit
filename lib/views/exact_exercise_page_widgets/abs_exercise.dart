import 'package:flutter/material.dart';
import 'package:flutter_team_project/models/exercise.dart';


class AbsExercise extends StatefulWidget {
  const AbsExercise({Key? key}) : super(key: key);

  @override
  _AbsExerciseState createState() => _AbsExerciseState();
}

class _AbsExerciseState extends State<AbsExercise> {

  List<Exercise> exerciseList = [
    Exercise(name: 'Прыжки', durationOrRepeat: '00:30'),
    Exercise(name: 'Скручивания', durationOrRepeat: '16 повтор.'),
    Exercise(name: 'Качели', durationOrRepeat: '20 повтор.'),
    Exercise(name: 'Альпинист', durationOrRepeat: '16 повтор.'),
    Exercise(name: 'Боковые наклоны к стопам', durationOrRepeat: '20 повтор.'),
    Exercise(name: 'Поднятия ног', durationOrRepeat: '16 повтор.'),
    Exercise(name: 'Планка', durationOrRepeat: '00:20'),
    Exercise(name: 'Скручивания', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Качели', durationOrRepeat: '32 повтор.'),
    Exercise(name: 'Альпинист', durationOrRepeat: '12 повтор.'),
    Exercise(name: 'Боковые наклоны к стопам', durationOrRepeat: '20 повтор.'),
    Exercise(name: 'Поднятия ног', durationOrRepeat: '14 повтор.'),
    Exercise(name: 'Планка', durationOrRepeat: '00:30'),
    Exercise(name: 'Растяжка "Кобра"', durationOrRepeat: '00:30'),
    Exercise(name: 'Скручивания в пояснице лежа (влево)', durationOrRepeat: '00:30'),
    Exercise(name: 'Скручивания в пояснице лежа (вправо)', durationOrRepeat: '00:30'),
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
