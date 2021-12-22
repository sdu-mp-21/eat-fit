import 'package:flutter/material.dart';
import 'package:flutter_team_project/db/person_database.dart';
import 'package:flutter_team_project/models/person.dart';
import 'package:flutter_team_project/onboard/body_page_1.dart';
import 'package:flutter_team_project/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'body_page_2.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {

  int currentIndex = 0;
  bool isButtonDisabled = true;
  int lastIndex = 0;

  int id = 0;
  String name = 'Имя';
  String? gender = 'Мужчина';
  String? goal = 'Похудеть';
  String age = '1';
  String height = '1';
  String weight = '1';
  String? bmi = '1';
  String imagePath = '';

  List<Widget> bodyPages = [
    const BodyPage1(),
    const BodyPage2(),
  ];

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () async {
              addPerson();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
              await _storeOnBoardInfo();
            },
            child: const Text('Skip'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              bodyPages[currentIndex],
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            title: Text('Пред.'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_forward_ios,
            ),
            title: Text('След.'),
          ),
        ],
        onTap: (index) {
          setState(() {
            if (lastIndex == 1 && index == 1) {
              _storeOnBoardInfo();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
            }
            currentIndex = index;
            lastIndex = currentIndex;
          });
        },
      ),
    );
  }

  Widget setText(String text, double fontSize, Color fontColor) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }

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
}
