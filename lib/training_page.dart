import 'package:flutter/material.dart';


class TrainingPage extends StatefulWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Эту страницу я потом сделаю"),
      color: Colors.greenAccent,
    );
  }
}