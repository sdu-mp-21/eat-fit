import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'models/person.dart';
import 'package:path_provider/path_provider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  String name = "";
  String goal = "";
  String age = "";
  String bmi = "";
  String height = "";
  String weight = "";

  String? dirPath;
  File? myFile;
  String fileText = '';

  Future getPath() async{
    final dir = await getApplicationDocumentsDirectory();
    dirPath = dir.path;
  }

  String convertToJson(Person person) {
    String json = jsonEncode(person);
    return json;
  }

  Future writeFile() async {
    Person person = new Person('Равиль Аман', 'Набрать мышечную массу', '19', '19.57', '178', '62');
    try {
      await myFile!.writeAsString(convertToJson(person));
    } catch (e) {
      print(e);
    }
  }

  Future readFile() async{
    try {
      String fileContent = await myFile!.readAsString();
      var dataFromFile = json.decode(fileContent);
      setState(() {
        name = dataFromFile['name'] as String;
        goal = dataFromFile['goal'] as String;
        age = dataFromFile['age'] as String;
        bmi = dataFromFile['bmi'] as String;
        height = dataFromFile['height'] as String;
        weight = dataFromFile['weight'] as String;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> refreshData() async{
    setState(() {
      readFile();
    });
  }

  @override
  void initState() {
    getPath().then((_) {
      myFile = File('$dirPath/person.txt');
      // writeFile();
      readFile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 15),
            onPressed: () {
              Navigator.pushNamed(context, '/edit_profile_page');
            },
            icon: Icon(
              Icons.edit_outlined,
              size: 26,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: refreshData,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                width: 180,
                height: 180,
                child: Image(
                  image: AssetImage('assets/profile_icon.png'),
                ),
              ),
              SizedBox(height: 15),
              _buildText('$name', 28),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProperties("Возраст", "$age"),
                  _buildProperties("ИМТ", "$bmi"),
                  _buildProperties("Рост", "$height см"),
                  _buildProperties("Вес", "$weight кг"),
                ],
              ),
              SizedBox(height: 30),
              _buildText('Цель:', 16),
              SizedBox(height: 5),
              /// Куда худеть то, и так прекрасно выглядишь
              // _buildText('Похудеть', 20),
              _buildText('$goal', 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProperties(String parameter, String value) {
    return Column(
      children: [
        _buildText(value, 20),
        SizedBox(height: 5),
        _buildText(parameter, 16),
      ],
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
