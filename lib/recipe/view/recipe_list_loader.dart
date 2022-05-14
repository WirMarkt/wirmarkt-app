import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../api/utils/fetch_status.dart';
import '../../generated/l10n.dart';
import '../../widgets/colored_progress_indicator.dart';
import '../../widgets/error_display.dart';
import '../bloc/recipe_bloc.dart';
import 'recipe_list_view.dart';

class RecipeListLoader extends StatefulWidget {
  const RecipeListLoader({super.key});

  @override
  State<RecipeListLoader> createState() => _RecipeListLoaderState();
}

class _RecipeListLoaderState extends State<RecipeListLoader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        switch (state.status) {
          case FetchStatus.uninitialized:
          case FetchStatus.loading:
            return ColoredProgressIndicator();
          case FetchStatus.completed:
            return RecipeListView(recipes: state.recipes);
          case FetchStatus.error:
            return ErrorDisplay(
              errorMessage: S.of(context).failedToLoadRecipesMessage,
              onRetryPressed: () {
                _refreshRecipeList();
              },
            );
        }
      },
    );
  }

  void _refreshRecipeList() {
    var canonLanguageName = Intl.canonicalizedLocale(Intl.getCurrentLocale());

    context.read<RecipeBloc>().add(RefreshRecipe(canonLanguageName));
  }

  @override
  void initState() {
    super.initState();

    _refreshRecipeList();
  }
}
