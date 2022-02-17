import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/recipe/model/recipe.dart';
import 'package:wir_markt/recipe/repository/recipe_repository.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository _recipeRepository;

  RecipeBloc({
    required RecipeRepository recipeRepository,
  })  : _recipeRepository = recipeRepository,
        super(const RecipeState()) {
    on<RefreshRecipe>(_onRefreshRecipes);
  }

  Future<void> _onRefreshRecipes(
    RefreshRecipe event,
    Emitter<RecipeState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      List<Recipe>? details =
          await _recipeRepository.getRecipes(languageCode: event.languageCode);
      emit(state.copyWith(status: FetchStatus.completed, recipes: details));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
