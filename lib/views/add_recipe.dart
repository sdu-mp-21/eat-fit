import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {

  final _formKey = GlobalKey<FormState>();

  String mealName = '';
  String cookingTime = '';
  String ingredients = '';
  String process = '';

  Future showToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
    );
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
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/add-image.png',
                    width: 130,
                    height: 130,
                  ),
                ),
                setTextFormFields(mealName, 'Название', 1),
                setTextFormFields(cookingTime, 'Время', 1),
                setTextFormFields(ingredients, 'Ингредиенты', null),
                setTextFormFields(process, 'Процесс приготовления', null),
                SizedBox(height: 15),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showToast('Блюдо добавлено!').then((_) {
                        Navigator.pop(context);
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

  Widget setTextFormFields(String variable, String fieldName, int? maxLines) {
    return TextFormField(
      minLines: 1,
      maxLines: maxLines,
      onChanged: (value) {
        variable = value;
      },
      style: TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(labelText: fieldName),
      controller: TextEditingController(text: variable),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите значение';
        }
        return null;
      },
    );
  }

  Widget setText(String text, double fontSize, Color fontColor) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
