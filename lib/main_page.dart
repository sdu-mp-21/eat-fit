import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_team_project/db/person_database.dart';
import 'package:flutter_team_project/models/person.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool isLoading = false;
  late Person person;

  int waterConsumption = 0;
  double waterConsumptionPercent = 0;

  String goal = "";
  String age = "";
  String height = "";
  String weight = "";

  String dayOfTheWeek = "";

  int timeCoefficient = 0;
  double? calorieBurnCoefficient;
  double ccalBurn = 0;
  double ccalMustBurn = 0;
  double ccalCons = 0;
  double ccalMustCons = 0;

  Future refreshPerson() async {
    setState(() => isLoading = true);
    person = await PersonDatabase.instance.readPerson(0);
    setState(() => isLoading = false);
    setData();
    setDate();
    getPercentages();
  }

  Future _getDateFuture() async{
    DateTime date = DateTime.now();
    String dateFormat = await DateFormat('EEEE').format(date);
    return dateFormat;
  }

  void setDate() async {
    dayOfTheWeek = await _getDateFuture();
    setState(() {
      dayOfTheWeek = dayOfTheWeek;
    });
  }

  Future getCalorieBurnCoefficient() async {
    setState(() {
      calorieBurnCoefficient = (66.74 + (13.75 * int.parse(weight)) + (5 * int.parse(height)) - (6.74 * int.parse(age))) / 1440;
    });
  }

  Future getDateDifference() async{
    String currentDate = DateTime.now().toString();
    String replacedDate = currentDate.replaceRange(11, 25, '00:00:00.000000');
    final startTime = DateTime.parse(replacedDate);
    final currentTime = DateTime.now();
    final timeDifference = currentTime.difference(startTime).inMinutes;
    return timeDifference;
  }

  Future calculateBurnedCalories() async{
    timeCoefficient = await getDateDifference();
    getCalorieBurnCoefficient().then((_) {
      setState(() {
        ccalBurn = (timeCoefficient * calorieBurnCoefficient!);
      });
    });
  }

  void calculateCcalMustBurn() {
    double goalCoeff = 1;
    switch (goal) {
      case ('Похудеть'):
        goalCoeff = 0.75;
        break;
      case ('Набрать мышечную массу'):
        goalCoeff = 1.15;
        break;
      case ('Сохранить текущий вес'):
        goalCoeff = 1;
        break;
    }
    setState(() {
      ccalMustBurn = (66.74 + (13.75 * int.parse(weight)) + (5 * int.parse(height)) - (6.74 * int.parse(age)) * goalCoeff);
    });
  }

  void getPercentages() async {
    calculateCcalMustBurn();
    calculateBurnedCalories();
  }

  void setData() {
    age = person.age!;
    goal = person.goal!;
    height = person.height!;
    weight = person.weight!;
  }

  @override
  void initState() {
    refreshPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: textWidgetBuilder('Статистика на сегодня:', 22, Colors.black),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      textWidgetBuilder('Сожжено:', 18, Colors.black),
                      SizedBox(height: 7,),
                      CircularPercentIndicator(
                        radius: 130,
                        lineWidth: 10,
                        backgroundColor: Colors.white,
                        percent: (ccalBurn / ccalMustBurn),
                        // progressColor: ,
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        center: textWidgetBuilder('${ccalBurn.toInt()} \nккал', 22, Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      textWidgetBuilder('Потреблено:', 18, Colors.black),
                      SizedBox(height: 7,),
                      CircularPercentIndicator(
                        radius: 130,
                        lineWidth: 10,
                        backgroundColor: Colors.white,
                        percent: 0,
                        progressColor: Colors.green,
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        center: textWidgetBuilder('$ccalCons \nккал', 22, Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.fromLTRB(40, 12, 40, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Column(
                children: [
                  textWidgetBuilder('Потребление воды:', 18, Colors.black),
                  SizedBox(height: 7,),
                  CircularPercentIndicator(
                    radius: 130,
                    lineWidth: 10,
                    backgroundColor: Colors.white,
                    percent: waterConsumption / 8,
                    progressColor: Colors.blueAccent,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidgetBuilder('$waterConsumption', 22, Colors.black),
                        Image.asset(
                          'assets/glass.png',
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState((){
                            if (waterConsumption > 0) {
                              waterConsumption--;
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(alignment: Alignment.center,child: textWidgetBuilder('-', 36, Colors.white)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState((){
                            if (waterConsumption < 8) {
                              waterConsumption++;
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(alignment: Alignment.center, child: textWidgetBuilder('+', 26, Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textWidgetBuilder(String text, double textSize, Color textColor) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        color: textColor,
      ),
    );
  }
}