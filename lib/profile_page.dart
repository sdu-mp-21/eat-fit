import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'models/person.dart';
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
  String goal = "";
  String age = "";
  String bmi = "";
  String height = "";
  String weight = "";

  String? dirPath;
  File? myFile;
  String fileText = '';

  File? image;
  String? imagePath;
  ImageSource imageSource = ImageSource.gallery;

  Future getPath() async{
    final dir = await getApplicationDocumentsDirectory();
    dirPath = dir.path;
  }

  String convertToJson(Person person) {
    String json = jsonEncode(person);
    return json;
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
        imagePath = dataFromFile['imagePath'] as String;
      });
    } catch (e) {
      print(e);
    }
  }

  Future writeFile() async {
    Person person = Person(name, goal, age, bmi, height, weight, imagePath);
    try {
      await myFile!.writeAsString(convertToJson(person));
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
      readFile();
    });
    setImage();
    super.initState();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    this.imagePath = '${directory.path}/$name';
    writeFile();
    return File(imagePath).copy(image.path);
  }

  void setImage() async {
    setState(() {
      image = File(imagePath!);
    });
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
              Navigator.pushNamed(context, '/edit_profile_page').then((value) => {refreshData()});
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
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  showImagePickOptionDialogue(context);
                },
                child: image != null ? ClipOval(child: Image.file(image!, width: 200, height: 200)) : Image.asset('assets/profile_icon.png', width: 200, height: 200,),
              ),
              SizedBox(height: 15),
              _buildText(name, 28),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProperties("Возраст", age),
                  _buildProperties("ИМТ", bmi),
                  _buildProperties("Рост", "$height см"),
                  _buildProperties("Вес", "$weight кг"),
                ],
              ),
              SizedBox(height: 30),
              _buildText('Цель:', 16),
              SizedBox(height: 5),
              _buildText(goal, 20),
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
