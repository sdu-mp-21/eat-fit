import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_team_project/db/person_database.dart';
import 'package:flutter_team_project/models/person.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:string_validator/string_validator.dart';

class BodyPage2 extends StatefulWidget {
  const BodyPage2({Key? key}) : super(key: key);

  @override
  _BodyPage2State createState() => _BodyPage2State();
}

class _BodyPage2State extends State<BodyPage2> {

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  int id = 0;
  String name = "Имя";
  String? gender = 'Мужчина';
  String? goal = "Похудеть";
  String age = "1";
  String height = "1";
  String weight = "1";
  String? bmi = "1";
  String imagePath = '';


  Future addPerson() async {
    final person = Person(
        id: id,
        name: name,
        gender: gender,
        goal: goal,
        age: age,
        height: height,
        weight: weight,
        bmi: bmi,
        imagePath: imagePath
    );
    await PersonDatabase.instance.create(person);
  }

  final goals = [
    'Похудеть',
    'Набрать мышечную массу',
    'Сохранить текущий вес',
  ];

  final genders = [
    'Мужчина',
    'Женщина',
    'Другое'
  ];

  Future showToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
    );
  }

  void calculateBmi() {
    double answer = int.parse(weight) / pow((int.parse(height) / 100), 2);
    bmi = answer.toString().substring(0, 4);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/humanoid.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 10),
          _buildText('Введите ваши данные', 20),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    name = value;
                  },
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(labelText: 'Имя'),
                  controller: TextEditingController(text: name),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста введите значение';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    age = value;
                  },
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(labelText: 'Возраст'),
                  controller: TextEditingController(text: age),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста введите значение';
                    } else if (!isInt(value)) {
                      return 'Пожалуйств введите целое число';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    height = value;
                  },
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(labelText: 'Рост (в сантиметрах)'),
                  controller: TextEditingController(text: height),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста введите значение';
                    } else if (!isInt(value) || !isFloat(value)) {
                      return 'Пожалуйств введите число';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    weight = value;
                  },
                  style: const TextStyle(fontSize: 16,),
                  decoration: const InputDecoration(labelText: 'Вес (в килограммах)'),
                  controller: TextEditingController(text: weight),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста введите значение';
                    } else if (!isInt(value) || !isFloat(value)) {
                      return 'Пожалуйств введите число';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          _buildText('Цель', 20),
          const SizedBox(height: 10),
          DropdownButton<String>(
            items: goals.map(buildMenuItem).toList(),
            onChanged: (value) => setState((){
              goal = value;
            }),
            value: goal,
          ),
          _buildText('Пол', 20),
          const SizedBox(height: 10),
          DropdownButton<String>(
            items: genders.map(buildMenuItem).toList(),
            onChanged: (value) => setState((){
              gender = value;
            }),
            value: gender,
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: _buildText(item, 16),
    );
  }

  Widget _buildText(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  @override
  void dispose() {
    calculateBmi();
    addPerson();
    super.dispose();
  }
}
