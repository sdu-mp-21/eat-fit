import 'dart:async';
import 'dart:convert';
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
  Color color = Colors.white;
  String sky = "";
  int temperature = 0;
  String date = "";
  String weatherIcon = "clear";
  int steps = 0;
  int ccalBurn = 0;
  int ccalCons = 0;

  void _getWeatherData() async {

    try {
      Response response = await Dio().get('https://api.openweathermap.org/data/2.5/weather?q=$city&lang=ru&appid=$apiKey&units=metric');
      var parsedJson = jsonDecode(response.toString());
      var main = parsedJson['weather'][0]['main'] as String;
      var temp = parsedJson['main']['temp'] as double;

      setState(() {
        sky = main;
        temperature = temp.toInt();
        weatherIcon = sky.toLowerCase();
      });

    } catch (e) {
      print(e);
    }
  }

  String _getDate() {
    DateTime date = DateTime.now();
    String dateFormat = DateFormat('EEEE').format(date);
    return dateFormat;
  }

  Future _getDateFuture() async{
    DateTime date = DateTime.now();
    String dateFormat = DateFormat('EEEE').format(date);
    return dateFormat;
  }

  void setDate() async {
    date = await _getDateFuture();
  }

  @override
  void initState() {
    // setState(() {
    //   setDate();
    // });
    date = _getDate();
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
                    Text(
                      '$sky',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$temperature',
                          style: TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            'о',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
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
                    Text(
                      '$date',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          '$city',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
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
          ElevatedButton(
            onPressed: () {
              _getWeatherData();
            },
            child: Text('get data'),
          ),
          ElevatedButton(
            onPressed: () {
              _showThemeDialog(context);
            },
            child: Text('theme'),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.redAccent, Colors.deepOrangeAccent],
              ),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text(
                          'Шагов за сегодня:',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.centerRight,
                        child: Text(
                          '$steps',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text(
                          'Сожжено ккал:',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.centerRight,
                        child: Text(
                          '$ccalBurn',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text(
                          'Потреблено ккал:',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.centerRight,
                        child: Text(
                          '$ccalCons',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
