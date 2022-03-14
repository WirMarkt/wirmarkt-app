import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wir_markt/widgets/icon_placeholder_image.dart';

import '../../generated/l10n.dart';
import '../model/recipe.dart';
import '../repository/recipe_repository.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repo = RepositoryProvider.of<RecipeRepository>(context);
    var imageUrl = repo.getAssetUrl(recipe.coverImage, presetKey: "cover");

    const titlePadding = EdgeInsets.only(top: 24.0, bottom: 16.0);
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconPlaceholderImage.network(imageUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TagBar(recipe: recipe),
                    Padding(
                      padding: titlePadding,
                      child: Text(
                        S.of(context).ingredients,
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: _IngredientsTable(recipe: recipe),
                    ),
                    Padding(
                      padding: titlePadding,
                      child: Text(
                        S.of(context).instructions,
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    Html(data: recipe.instructions ?? "No instructions given"),
                    Padding(
                      padding: titlePadding,
                      child: Text(
                        S.of(context).notes,
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    Html(data: recipe.notes ?? "No notes given"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IngredientsTable extends StatelessWidget {
  const _IngredientsTable({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var oddColor = Theme.of(context).backgroundColor;
    var evenColor = Theme.of(context).primaryColor.withAlpha(30);
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(5),
      },
      children: recipe.recipeIngredients.asMap().entries.map((entry) {
        var recipeIngredient = entry.value;
        var index = entry.key;
        return TableRow(
          decoration: BoxDecoration(
            color: index.isOdd ? oddColor : evenColor,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(recipeIngredient.amount),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recipeIngredient.ingredient,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _TagBar extends StatelessWidget {
  const _TagBar({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: recipe.tags
          .map((tag) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(tag,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Theme.of(context).backgroundColor)),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(16)),
              ))
          .toList(),
    );
  }
}
