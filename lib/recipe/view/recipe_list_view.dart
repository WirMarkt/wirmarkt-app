import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/recipe/widget/recipe_card.dart';

import '../../generated/l10n.dart';
import '../../utils/logical_size_utils.dart';
import '../../widgets/responsive_sized_wrap.dart';
import '../model/recipe.dart';
import '../repository/recipe_repository.dart';
import 'recipe_detail_page.dart';

class RecipeListView extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeListView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
      return Text(
        S.of(context).noRecipesInYourLanguageFound,
      );
    } else {
      var cards = recipes.map((recipe) {
        var repo = RepositoryProvider.of<RecipeRepository>(context);
        return RecipeCard(
          onTap: () {
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => RecipeDetailPage(
                  recipe: recipe,
                ),
              ),
            );
          },
          title: recipe.title,
          explanation: recipe.summary ?? "",
          imageUrl: repo.getAssetUrl(recipe.coverImage, presetKey: "cover"),
        );
      }).toList();
      return ResponsiveSizedWrap(
        children: cards,
        columnCount: {
          LogicalWidth.sm: 2,
        },
      );
    }
  }
}
