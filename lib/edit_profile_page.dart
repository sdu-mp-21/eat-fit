import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_team_project/db/person_database.dart';
import 'package:flutter_team_project/models/person.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:string_validator/string_validator.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final _formKey = GlobalKey<FormState>();

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

  String name = "";
  String? goal;
  String age = "";
  String height = "";
  String weight = "";
  String? bmi;
  String imagePath = '';
  String? gender;
  late Person person;
  bool isLoading = false;

  Future refreshPerson() async {
    setState(() => isLoading = true);
    person = await PersonDatabase.instance.readPerson(0);
    setState(() => isLoading = false);
    setData();
  }

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

  Future updatePersonData() async {
    calculateBmi();
    final person = this.person.copy(
      name: name,
      gender: gender,
      age: age,
      goal: goal,
      bmi: bmi,
      height: height,
      weight: weight,
      imagePath: imagePath
    );

    await PersonDatabase.instance.update(person);
  }

  void setData() {
    name = person.name!;
    gender = person.gender!;
    age = person.age!;
    goal = person.goal!;
    bmi = person.bmi!;
    height = person.height!;
    weight = person.weight!;
    imagePath = person.imagePath!;
  }

  @override
  void initState() {
    refreshPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактировать профиль'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onChanged: (value) {
                    name = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Имя'),
                  controller: TextEditingController(text: name),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста введите значение';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildText('Пол:', 16),
                DropdownButton<String>(
                  value: gender,
                  items: genders.map(buildMenuItem).toList(),
                  onChanged: (value) => setState((){
                    gender = value;
                  }),
                ),
                SizedBox(height: 20),
                _buildText('Цель:', 16),
                DropdownButton<String>(
                  value: goal,
                  items: goals.map(buildMenuItem).toList(),
                  onChanged: (value) => setState((){
                    goal = value;
                  }),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    age = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Возраст'),
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
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    height = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Рост (в сантиметрах)'),
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
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    weight = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Вес в килограммах'),
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      updatePersonData();
                      print('$gender');
                      showToast('Изменения сохранены успешно!').then((_) {
                        Navigator.pop(context, true);
                      });
                    } else {
                      showToast('Пожалуйста, введите значения!');
                    }
                  },
                  child: Text('Подтвердить'),
                ),
              ],
            ),
          ),
        ),
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
}
