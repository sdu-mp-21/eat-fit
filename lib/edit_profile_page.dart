import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_team_project/models/person.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:string_validator/string_validator.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final _formKey = GlobalKey<FormState>();

  String name = "";
  String goal = "";
  String age = "";
  String bmi = "";
  String height = "";
  String weight = "";
  String imagePath = '';
  String? directoryPath;
  File? dataFile;

  Future getPath() async {
    final directory = await getApplicationDocumentsDirectory();
    directoryPath = directory.path;
  }

  String convertToJson(Person person) {
    String json = jsonEncode(person);
    return json;
  }

  Future writeFile(Person person) async{
    try {
      await dataFile!.writeAsString(convertToJson(person));
    } catch (e) {
      print(e);
    }
  }

  Future readFile() async{
    try {
      String fileContent = await dataFile!.readAsString();
      var dataInJson = json.decode(fileContent);
      setState(() {
        name = dataInJson['name'] as String;
        goal = dataInJson['goal'] as String;
        age = dataInJson['age'] as String;
        bmi = dataInJson['bmi'] as String;
        height = dataInJson['height'] as String;
        weight = dataInJson['weight'] as String;
      });
    } catch (e) {
      print(e);
    }
  }

  Person refreshData() {
    Person person = Person(name, goal, age, bmi, height, weight, imagePath);
    return person;
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

  @override
  void initState() {
    getPath().then((_) {
      dataFile = File('$directoryPath/person.txt');
      readFile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 130,
                  height: 130,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.image_outlined,
                      size: 140,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                _buildText('Имя:', 20),
                TextFormField(
                  onChanged: (value) {
                    name = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Введите данные сюда'),
                  controller: TextEditingController(text: name),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста введите значение';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildText('Цель:', 20),
                TextFormField(
                  onChanged: (value) {
                    goal = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Введите данные сюда'),
                  controller: TextEditingController(text: goal),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста введите значение';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildText('Возраст:', 20),
                TextFormField(
                  onChanged: (value) {
                    age = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Введите данные сюда'),
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
                _buildText('ИМТ:', 20),
                TextFormField(
                  onChanged: (value) {
                    bmi = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Введите данные сюда'),
                  controller: TextEditingController(text: bmi),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста введите значение';
                    } else if (!isInt(value) && !isFloat(value)) {
                      return 'Пожалуйств введите число';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildText('Рост:', 20),
                TextFormField(
                  onChanged: (value) {
                    height = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Введите данные сюда'),
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
                _buildText('Вес:', 20),
                TextFormField(
                  onChanged: (value) {
                    weight = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Введите данные сюда'),
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
                    if (_formKey.currentState!.validate()) {
                      writeFile(refreshData());
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

  Widget _buildText(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}
