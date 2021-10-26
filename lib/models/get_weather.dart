import 'dart:convert';
import 'package:dio/dio.dart';

/// Пока не работает, кое какие проблемы с Future, потом разберусь


class WeatherData {

  String city = "Almaty";
  String apiKey = "f1cb900ecaa9ff0334f0d9e2afc55ce6";
  String sky = "";
  String temperature = "0";
  String weatherIcon = "";

  Future getWeatherData() async {
    double temp = 0.0;
    try {
      Response response = await Dio().get('https://api.openweathermap.org/data/2.5/weather?q=$city&lang=ru&appid=$apiKey&units=metric');
      var parsedJson = jsonDecode(response.toString());
      sky = parsedJson['weather'][0]['main'] as String;
      temp = parsedJson['main']['temp'] as double;
      temperature = temp.toString();
      weatherIcon = sky.toLowerCase();
    } catch (e) {
      print(e);
    }
    List<String> data = [sky, temperature, weatherIcon];
    return data;
  }
}
