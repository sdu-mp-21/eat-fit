import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_team_project/db/person_database.dart';
import 'package:flutter_team_project/models/person.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  String name = "";
  String gender = '';
  String goal = "";
  String age = "";
  String bmi = "";
  String height = "";
  String weight = "";

  late Person person;
  bool isLoading = false;

  File? image;
  String? imagePath;
  ImageSource imageSource = ImageSource.gallery;

  Future refreshPerson() async {
    setState(() => isLoading = true);
    person = await PersonDatabase.instance.readPerson(0);
    setState(() => isLoading = false);
    setData();
    setImage();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
      });
      updatePersonData();
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    this.imagePath = image.path;
    return File(imagePath).copy(image.path);
  }

  Future updatePersonData() async {
    final person = this.person.copy(
        name: name,
        gender: gender,
        age: age,
        goal: goal,
        bmi: bmi,
        height: height,
        weight: weight,
        imagePath: imagePath
    );

    await PersonDatabase.instance.update(person);
  }

  void setImage() async {
    setState(() {
      image = File(imagePath!);
    });
  }

  void setData() {
    name = person.name!;
    gender = person.gender!;
    age = person.age!;
    goal = person.goal!;
    bmi = person.bmi!;
    height = person.height!;
    weight = person.weight!;
    imagePath = person.imagePath!;
  }

  @override
  void initState() {
    refreshPerson();
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
              Navigator.pushNamed(context, '/edit_profile_page').then((value) => {refreshPerson()});
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
        onRefresh: refreshPerson,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  showImagePickOptionDialogue(context);
                },
                child: imagePath?.length == 0 ? Image.asset('assets/profile_icon.png', width: 200, height: 200,) : ClipOval(child: Image.file(image!, width: 200, height: 200)),
              ),
              SizedBox(height: 15),
              _buildText(person.name!, 28),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProperties("Возраст", person.age!),
                  _buildProperties("ИМТ", person.bmi!),
                  _buildProperties("Рост", "${person.height!} см"),
                  _buildProperties("Вес", "${person.weight!} кг"),
                ],
              ),
              SizedBox(height: 30),
              _buildText('Цель:', 16),
              SizedBox(height: 5),
              _buildText(person.goal!, 20),
              SizedBox(height: 20),
              _buildText('Пол:', 16),
              SizedBox(height: 5),
              _buildText(person.gender!, 20),
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
      text,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  showImagePickOptionDialogue(BuildContext context) async {
    await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text('Выберите картинку'),
            content: Text('Выберите откуда загрузить картинку'),
            actions: [
              CupertinoDialogAction(
                child: GestureDetector(
                  onTap: () {
                    imageSource = ImageSource.gallery;
                    Navigator.pop(context);
                    pickImage();
                  },
                  child: Image.asset(
                    'assets/gallery.png',
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
              CupertinoDialogAction(
                child: GestureDetector(
                  onTap: () {
                    imageSource = ImageSource.camera;
                    Navigator.pop(context);
                    pickImage();
                  },
                  child: Image.asset(
                    'assets/camera.png',
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}
