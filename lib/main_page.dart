import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String city = "Almaty";
  String apiKey = "f1cb900ecaa9ff0334f0d9e2afc55ce6";
  String sky = "";
  int temperature = 0;
  String weatherIcon = "clear";
  bool isThereConnection = false;

  String dayOfTheWeek = "";

  Color color = Colors.white;

  int steps = 1263;
  int timeCoefficient = 0;
  double calorieBurnCoefficient = 1.6;
  int ccalBurn = 0;
  int ccalMustBurn = 2300;
  int ccalCons = 1250;
  int ccalMustCons = 2600;

  double burnPercentage = 0;
  double consPercentage = 0;

  void checkConnection() async {
    isThereConnection = await InternetConnectionChecker().hasConnection;
    _getWeatherData();
  }

  void _getWeatherData() async {
    var temp = 0.0;
    var weatherIconPath = "";
    if (isThereConnection) {
      try {
        Response response = await Dio().get('https://api.openweathermap.org/data/2.5/weather?q=$city&lang=ru&appid=$apiKey&units=metric');
        var parsedJson = jsonDecode(response.toString());
        sky = parsedJson['weather'][0]['main'] as String;
        temp = parsedJson['main']['temp'] as double;
      } catch (e) {
        print(e);
      }
      weatherIconPath = sky.toLowerCase();
    } else {
      weatherIconPath = "no_image";
      showMessage(context);
    }
    setState(() {
      temperature = temp.toInt();
      weatherIcon = weatherIconPath;
    });
  }

  void showMessage(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar (
        SnackBar (
          content: Text('No Connection!'),
        )
    );
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
    checkConnection();
    calculateBurnedCalories();
    getPercentages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        color: color,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 15, 10, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue[800]!, Colors.lightBlueAccent]
                ),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      textWidgetBuilder('$sky', 18, Colors.white),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidgetBuilder('$temperature', 70, Colors.white),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: textWidgetBuilder('o', 18, Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 13),
                  Container(
                    color: Colors.grey,
                    child: SizedBox(width: 1, height: 80,),
                  ),
                  SizedBox(width: 13),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      textWidgetBuilder('$dayOfTheWeek', 18, Colors.white),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.location_on_rounded, color: Colors.white,),
                          textWidgetBuilder('$city', 18, Colors.white),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.centerRight,
                      child: Image(
                        image: AssetImage('assets/IconPack/$weatherIcon.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     _showThemeDialog(context);
            //   },
            //   child: Text('theme'),
            // ),
            SizedBox(height: 15),
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
                  textWidgetBuilder('Сделано шагов:', 18, Colors.black),
                  SizedBox(height: 7,),
                  CircularPercentIndicator(
                    radius: 130,
                    lineWidth: 10,
                    backgroundColor: Colors.white,
                    percent: 0.421,
                    progressColor: Colors.blueAccent,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidgetBuilder('$steps', 22, Colors.black),
                        Icon(
                          Icons.directions_walk,
                          size: 23,
                        ),
                      ],
                    ),
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