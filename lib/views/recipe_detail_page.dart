import 'package:flutter/material.dart';
import 'package:flutter_team_project/db/recipes_database.dart';
import 'package:flutter_team_project/models/recipes.dart';
import 'package:flutter_team_project/views/edit_recipe_page.dart';

class RecipeDetail extends StatefulWidget {
  final int recipeId;

  const RecipeDetail({
    Key? key,
    required this.recipeId,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  late Recipes recipe;
  bool isLoading = false;

  Future refreshRecipes() async {
    setState(() => isLoading = true);
    recipe = await RecipesDatabase.instance.readRecipe(widget.recipeId);
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    refreshRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildText(recipe.name!, 22, Colors.white),
        centerTitle: true,
        actions: [editButton(), deleteButton()],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/add-image.png',
                  width: 130,
                  height: 130,
                ),
              ),
              SizedBox(height: 30),
              _buildText('Название блюда:', 18, Colors.grey[800]!),
              SizedBox(height: 2),
              _buildText(recipe.name!, 22, Colors.black),
              SizedBox(height: 15),
              _buildText('Время приготовления:', 18, Colors.grey[800]!),
              SizedBox(height: 2),
              _buildText(recipe.time!, 22, Colors.black),
              SizedBox(height: 15),
              _buildText('Ингредиенты:', 18, Colors.grey[800]!),
              SizedBox(height: 2),
              _buildText(recipe.ingredients!, 22, Colors.black),
              SizedBox(height: 15),
              _buildText('Способ приготовления:', 18, Colors.grey[800]!),
              SizedBox(height: 2),
              _buildText(recipe.cooking!, 22, Colors.black),
            ],
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

  Widget editButton() {
    return IconButton(
        icon: Icon(Icons.edit_outlined),
        onPressed: () async {
          if (isLoading) return;

          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditRecipePage(recipe: recipe),
          ));
          refreshRecipes();
        }
    );
  }

  Widget deleteButton() {
    return IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await RecipesDatabase.instance.delete(widget.recipeId);
          Navigator.pop(context, true);
        }
    );
  }
}
