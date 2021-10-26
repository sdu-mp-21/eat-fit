import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';


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
  int ccalCons = 3047;

  void checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      if (await DataConnectionChecker().hasConnection) {
        isThereConnection = true;
      } else {
        isThereConnection = false;
      }
    } else if (ConnectivityResult == ConnectivityResult.wifi) {
      if (await DataConnectionChecker().hasConnection) {
        isThereConnection = true;
      } else {
        isThereConnection = false;
      }
    } else {
      isThereConnection = false;
    }
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
  /// и всчитаю коэффициент сжигания калории в минуту
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
  }

  @override
  void initState() {
    setDate();
    checkConnection();
    calculateBurnedCalories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.redAccent, Colors.orange],
              ),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.local_fire_department, size: 30, color: Colors.white,),
                    SizedBox(width: 5,),
                    textWidgetBuilder(':', 28, Colors.white),
                    SizedBox(width: 30,),
                    textWidgetBuilder('$ccalBurn ccal', 26, Colors.white),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Icon(Icons.set_meal, size: 30, color: Colors.white,),
                    SizedBox(width: 5,),
                    textWidgetBuilder(':', 28, Colors.white),
                    SizedBox(width: 30,),
                    textWidgetBuilder('$ccalCons ccal', 26, Colors.white),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Icon(Icons.directions_walk, size: 30, color: Colors.white,),
                    SizedBox(width: 5,),
                    textWidgetBuilder(':', 28, Colors.white),
                    SizedBox(width: 30,),
                    textWidgetBuilder('$steps steps', 26, Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ],
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