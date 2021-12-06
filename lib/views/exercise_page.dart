import 'package:flutter/material.dart';
import 'package:flutter_team_project/models/muscle_group_training.dart';
import 'package:flutter_team_project/views/exact_exercise_page_widgets/abs_exercise.dart';
import 'package:flutter_team_project/views/exact_exercise_page_widgets/arm_exercise.dart';
import 'package:flutter_team_project/views/exact_exercise_page_widgets/chest_exercise.dart';
import 'package:flutter_team_project/views/exact_exercise_page_widgets/leg_exercise.dart';
import 'package:flutter_team_project/views/exact_exercise_page_widgets/shoulders_exercise.dart';
import 'package:flutter_team_project/views/exact_exercise_page_widgets/spine_exercise.dart';

class ExercisePage extends StatefulWidget {
  final String? text;
  const ExercisePage({Key? key, @required this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExercisePageState(text);
  }
}

class _ExercisePageState extends State<ExercisePage> {
  String? text;
  _ExercisePageState(this.text);

  List<MuscleGroupTraining> muscleGroupTrainingList = [
    MuscleGroupTraining(name: 'Пресс', amountOfExercise: '16', trainingTime: '15', burnedCalories: '255'),
    MuscleGroupTraining(name: 'Грудь', amountOfExercise: '11', trainingTime: '4', burnedCalories: '47'),
    MuscleGroupTraining(name: 'Ноги', amountOfExercise: '23', trainingTime: '18', burnedCalories: '226'),
    MuscleGroupTraining(name: 'Руки', amountOfExercise: '19', trainingTime: '14', burnedCalories: '167'),
    MuscleGroupTraining(name: 'Плечи', amountOfExercise: '7', trainingTime: '9', burnedCalories: '78'),
    MuscleGroupTraining(name: 'Спина', amountOfExercise: '17', trainingTime: '13', burnedCalories: '161'),
  ];

  String? amountOfExercise = '0';
  String? trainingTime = '0';
  String? burnedCalories = '0';

  void setTrainingData(int index) {
    amountOfExercise = muscleGroupTrainingList[index].amountOfExercise;
    trainingTime = muscleGroupTrainingList[index].trainingTime;
    burnedCalories = muscleGroupTrainingList[index].burnedCalories;
  }

  @override
  void initState() {
    switch (text) {
      case 'Пресс':
        setTrainingData(0);
        break;
      case 'Грудь':
        setTrainingData(1);
        break;
      case 'Ноги':
        setTrainingData(2);
        break;
      case 'Руки':
        setTrainingData(3);
        break;
      case 'Плечи':
        setTrainingData(4);
        break;
      case 'Спина':
        setTrainingData(5);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildText('$text', 22, Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildText('Тренировка: $text', 22, Colors.black),
              SizedBox(height: 15,),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.timer_rounded,
                                size: 20,
                              ),
                              SizedBox(width: 2,),
                              _buildText('$trainingTime минут', 20, Colors.black),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.local_fire_department_outlined,
                                size: 20,
                              ),
                              SizedBox(width: 2,),
                              _buildText('$burnedCalories ккал.', 20, Colors.black),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              _buildText('Упражнении: $amountOfExercise', 22, Colors.black),
              SizedBox(height: 15,),
              _buildExerciseElement(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseElement() {
    Widget exactExercisePage = AbsExercise();
    switch (text) {
      case 'Пресс':
        exactExercisePage = AbsExercise();
        break;
      case 'Грудь':
        exactExercisePage = ChestExercise();
        break;
      case 'Ноги':
        exactExercisePage = LegExercise();
        break;
      case 'Руки':
        exactExercisePage = ArmExercise();
        break;
      case 'Плечи':
        exactExercisePage = ShouldersExercise();
        break;
      case 'Спина':
        exactExercisePage = SpineExercise();
        break;
    }
    return exactExercisePage;
  }

  // Widget _buildExerciseElement(String exerciseName, String repeat) {
  //   return Row(
  //     children: [
  //       Image.asset(
  //           'assets/exercise_pack/exercises.png',
  //         width: 40,
  //         height: 40,
  //       ),
  //       Column(
  //         children: [
  //           _buildText(exerciseName, 18, Colors.black),
  //           SizedBox(height: 7,),
  //           _buildText(repeat, 18, Colors.black),
  //         ],
  //       ),
  //     ],
  //   );
  // }

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