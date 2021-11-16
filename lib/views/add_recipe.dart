import 'package:flutter/material.dart';
import 'package:flutter_team_project/db/recipes_database.dart';
import 'package:flutter_team_project/models/recipes.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {

  final _formKey = GlobalKey<FormState>();

  String? name;
  String? ingredients;
  // String? imagePath;
  String? time;
  String? cooking;

  Future showToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
    );
  }

  Future addRecipe() async {
    final recipe = Recipes(
      name: name,
      ingredients: ingredients,
      time: time,
      cooking: cooking,
    );
    await RecipesDatabase.instance.create(recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: setText('Добавить рецепт блюда', 22, Colors.white),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/add-image.png',
                    width: 130,
                    height: 130,
                  ),
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  onChanged: (value) {
                    name = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Название'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите значение';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  onChanged: (value) {
                    time = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Время приготовления'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите значение';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: null,
                  onChanged: (value) {
                    ingredients = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Ингредиенты'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите значение';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: null,
                  onChanged: (value) {
                    cooking = value;
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(labelText: 'Процесс приготовления'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите значение';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addRecipe();
                      showToast('Блюдо добавлено!').then((_) {
                        Navigator.pop(context, true);
                      });
                    } else {
                      showToast('Пожалуйста, введите значения!');
                    }
                  },
                  color: Colors.blueAccent,
                  child: setText('Добавить', 18, Colors.white),
                ),
              ],
            ),
          ),
        ),
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
}
