import 'package:flutter/material.dart';
import 'package:flutter_team_project/db/recipes_database.dart';
import 'package:flutter_team_project/models/recipes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditRecipePage extends StatefulWidget {
  final Recipes recipe;

  const EditRecipePage({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _EditRecipePageState createState() => _EditRecipePageState();
}

class _EditRecipePageState extends State<EditRecipePage> {

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

  Future updateRecipe() async {
    final recipe = widget.recipe.copy(
      name: name,
      ingredients: ingredients,
      time: time,
      cooking: cooking,
    );

    await RecipesDatabase.instance.update(recipe);
  }

  @override
  void initState() {
    super.initState();

    name = widget.recipe.name;
    time = widget.recipe.time;
    ingredients = widget.recipe.ingredients;
    cooking = widget.recipe.cooking;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildText('Поменять рецепт', 22, Colors.white),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
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
                  controller: TextEditingController(text: name),
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
                  controller: TextEditingController(text: time),
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
                  controller: TextEditingController(text: ingredients),
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
                  controller: TextEditingController(text: cooking),
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
                      updateRecipe();
                      showToast('Рецепт изменен!').then((_) {
                        Navigator.pop(context, true);
                      });
                    } else {
                      showToast('Пожалуйста, введите значения!');
                    }
                  },
                  color: Colors.blueAccent,
                  child: _buildText('Изменить', 18, Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, double size, Color textColor) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: textColor,
      ),
    );
  }
}
