import 'package:flutter/material.dart';
import 'package:flutter_team_project/db/recipes_database.dart';
import 'package:flutter_team_project/models/recipes.dart';
import 'package:flutter_team_project/views/recipe_detail_page.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late List<Recipes> recipes;
  bool isLoading = false;

  Future refreshRecipes() async {
    setState(() => isLoading = true);
    recipes = await RecipesDatabase.instance.readAllRecipes();
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    refreshRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_recipe').then((value) => {setState(() {refreshRecipes();})});
            },
            child: _buildText('+', 30, Colors.white),
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 2,),
        Center(
          child: Container(
            child: isLoading ?
            CircularProgressIndicator() : recipes.isEmpty ?
            _buildText('Рецепты не добавлены', 18, Colors.black) : buildRecipes(),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget buildRecipes() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipes.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => RecipeDetail(recipeId: recipe.id!)
                )).then((value) => refreshRecipes());
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // color: containerColors[recipe.id! % 2],
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText('${recipe.name}', 19, Colors.black),
                SizedBox(height: 6,),
                _buildText('${recipe.ingredients}', 16, Colors.black),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Icon(
                      Icons.timer_rounded,
                      size: 20,
                    ),
                    SizedBox(width: 3),
                    _buildText('${recipe.time}', 16, Colors.black),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
