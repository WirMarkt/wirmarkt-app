import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/recipe/widget/recipe_card.dart';

import '../../generated/l10n.dart';
import '../model/recipe.dart';
import '../repository/recipe_repository.dart';

class RecipeListView extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeListView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingVertical = 16.0;

    if (recipes.isEmpty) {
      return Center(child: Text(S.of(context).noRecipesInYourLanguageFound));
    } else {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: paddingVertical),
              ...recipes.map((recipe) {
                var repo = RepositoryProvider.of<RecipeRepository>(context);
                return RecipeCard(
                  title: recipe.title,
                  explanation: recipe.summary ?? "",
                  image: NetworkImage(
                      repo.getAssetUrl(recipe.coverImage, presetKey: "cover")),
                );
              }),
              const SizedBox(height: paddingVertical * 2),
            ],
          ),
        ),
      );
    }
  }
}
