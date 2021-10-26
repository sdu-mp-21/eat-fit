import 'package:flutter/material.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  String name = "";
  String goal = "";
  String age = "";
  String bmi = "";
  String height = "";
  String weight = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
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
                decoration: InputDecoration(labelText: 'Введите число сюда'),
                initialValue: "$name",
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
                decoration: InputDecoration(labelText: 'Введите число сюда'),
                initialValue: "$goal",
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
                decoration: InputDecoration(labelText: 'Введите число сюда'),
                initialValue: "$age",
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
                decoration: InputDecoration(labelText: 'Введите число сюда'),
                initialValue: "$bmi",
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
                decoration: InputDecoration(labelText: 'Введите число сюда'),
                initialValue: "$height",
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
                decoration: InputDecoration(labelText: 'Введите число сюда'),
                initialValue: "$weight",
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('Подтвердить'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, double size) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}
