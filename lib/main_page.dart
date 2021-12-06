import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String dayOfTheWeek = "";

  Color color = Colors.white;

  int timeCoefficient = 0;
  double calorieBurnCoefficient = 1.6;
  int ccalBurn = 0;
  int ccalMustBurn = 2300;
  int ccalCons = 1250;
  int ccalMustCons = 2600;

  double burnPercentage = 0;
  double consPercentage = 0;

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

  ///
  /// Здесь я должен потом написать метод где считаю с файла данные пользователя
  /// и высчитаю коэффициент сжигания калории в минуту
  ///

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
    setState(() {
      ccalBurn = (timeCoefficient * calorieBurnCoefficient).toInt();
    });
    return ccalBurn;
  }

  void getPercentages() async{
    burnPercentage = await calculateBurnedCalories() / ccalMustBurn;
    consPercentage = ccalCons / ccalMustCons;
  }

  @override
  void initState() {
    setDate();
    calculateBurnedCalories();
    getPercentages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
      color: color,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     _showThemeDialog(context);
            //   },
            //   child: Text('theme'),
            // ),
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
                        percent: burnPercentage,
                        // progressColor: ,
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        center: textWidgetBuilder('$ccalBurn \nккал', 22, Colors.black),
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
                        percent: consPercentage,
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

  _showThemeDialog(BuildContext context) async {
    await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text('App theme'),
              content: Text('Please choose the theme:'),
              actions: <Widget>[
                TextButton(
                    child: Text('Light'),
                    onPressed: () {
                      color = Colors.white;
                      Navigator.pop(context, color);
                    }
                ),
                TextButton(
                    child: Text('Dark'),
                    onPressed: () {
                      color = Colors.black87;
                      Navigator.pop(context, color);
                    }
                )
              ]
          );
        }
    );
    setState(() {
      color = color;
    });
  }
}